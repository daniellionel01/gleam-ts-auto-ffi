export function add(x: number, y: number) {
  return x + y;
}

export function greet(name: string) {
  return `hello ${name}!`;
}

export function append(list: string[], item: string) {
  list.push(item);
}

export function nuller(): null {
  return null;
}

export function undefiner(): undefined {
  return undefined;
}

export async function prom(): Promise<string> {
  await Promise.resolve();
  return "";
}

export function recorder(obj: Record<string, number>): null {
  Object.keys(obj);
  return null;
}
