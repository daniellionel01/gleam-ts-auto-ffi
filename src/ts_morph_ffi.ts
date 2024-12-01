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

    const params = fn.getParameters()
      .map((p) => {
        const name = p.getName();
        const type = mapTypeToGleam(p.getType());
        return `${name}: ${type}`;
      })
      .join(", ");

    const external = `@external(javascript, "${importPath}", "${name}")`;
    const definition = `pub fn ${name}(${params}) -> ${returnType}`;
    output.push(`${external}\n${definition}`);
  }

  return output.join("\n\n");
}

function mapTypeToGleam(type: Type) {
  const name = type.getText();
  if (name === "number") {
    return "Float";
  } else if (name === "string") {
    return "String";
  } else if (name === "boolean") {
    return "Bool";
  }

  return "Dynamic";
}
