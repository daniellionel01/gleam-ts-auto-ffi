import ts_auto_ffi/main

pub fn main() {
  main.generate_ffi(
    ts_path: "./sample_simple.ts",
    out_path: "./src/gen/simple.gleam",
  )
}
