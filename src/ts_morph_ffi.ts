import { Project, Type } from "ts-morph";

export function main(typescript: string, importPath: string): string {
  const project = new Project({
    useInMemoryFileSystem: true,
  });
  const source = project.createSourceFile("main.ts", typescript);

  const output: string[] = [];

  const fns = source.getFunctions();
  for (const fn of fns) {
    const name = fn.getName();

    const returnType = mapTypeToGleam(fn.getReturnType());
    console.log(`${fn.getReturnType().getText()} -> ${returnType}`);

    const params = fn.getParameters()
      .map((p) => {
        const name = p.getName();
        const type = mapTypeToGleam(p.getType());
        console.log(`${p.getType().getText()} -> ${type}`);
        return `${name}: ${type}`;
      })
      .join(", ");

    const external = `@external(javascript, "${importPath}", "${name}")`;
    const definition = `pub fn ${name}(${params}) -> ${returnType}`;
    output.push(`${external}\n${definition}`);
  }

  let result = output.join("\n\n");

  if (result.includes("Dynamic")) {
    result = `import gleam/dynamic.{type Dynamic}\n\n${result}`;
  }
  return result;
}

function mapTypeToGleam(type: Type): string {
  const name = type.getText();
  if (name === "number") {
    return "Float";
  } else if (name === "string") {
    return "String";
  } else if (name === "boolean") {
    return "Bool";
  } else if (name === "void" || name === "null" || name === "undefined") {
    return "Nil";
  }

  if (type.isArray()) {
    const elType = mapTypeToGleam(type.getArrayElementTypeOrThrow());
    return `List(${elType})`;
  } else if (isPromise(type)) {
    const args = type.getTypeArguments();
    const elType = mapTypeToGleam(args[0]);
    return `Result(${elType}, String)`;
  } else if (type.isObject()) {
    // TODO
  }

  return "Dynamic";
}

// Thank you https://gist.github.com/zaripych/963fa6584524e5b446b70548dbabbf65
function isPromise(type: Type) {
  const symbol = type.getSymbol();
  if (!type.isObject() || !symbol) {
    return false;
  }
  const args = type.getTypeArguments();
  return symbol.getName() === "Promise" && args.length === 1;
}
