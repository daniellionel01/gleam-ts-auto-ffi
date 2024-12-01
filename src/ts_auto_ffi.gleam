import filepath
import gleam/io
import simplifile

pub fn main() {
  let assert Ok(_) =
    generate_ffi(
      ts_path: "./src/sample_scalar_types.ts",
      import_path: "../sample_scalar_types.ts",
      out_path: "./src/gen/scalar_types.gleam",
    )
}

pub type GenerateError {
  UnknownError(String)
}

@external(javascript, "./ts_morph_ffi.ts", "main")
pub fn ts_morph(sourcefile: String, import_path: String) -> String

pub fn generate_ffi(
  ts_path ts_path: String,
  import_path import_path: String,
  out_path out_path: String,
) -> Result(Nil, GenerateError) {
  let dir = filepath.directory_name(out_path)
  let _ = simplifile.create_directory_all(dir)

  let assert Ok(typescript) = simplifile.read(ts_path)

  let typescript_ffi = ts_morph(typescript, import_path)

  let _ = case simplifile.is_file(out_path) {
    Ok(True) -> {
      let assert Ok(_) = simplifile.delete(out_path)
    }
    _ -> Ok(Nil)
  }
  let assert Ok(_) = simplifile.write(to: out_path, contents: typescript_ffi)

  Ok(Nil)
}
