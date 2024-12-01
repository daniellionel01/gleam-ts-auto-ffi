import filepath
import gleam/io
import simplifile
import ts_auto_ffi/internal/ts_morph

pub type GenerateError {
  UnknownError(String)
}

pub fn generate_ffi(
  ts_path ts_path: String,
  out_path out_path: String,
) -> Result(Nil, GenerateError) {
  let dir = filepath.directory_name(out_path)
  let _ = simplifile.create_directory_all(dir)

  let assert Ok(typescript) = simplifile.read(ts_path)

  let typescript_ffi = ts_morph.generate(typescript, ts_path)
  io.debug(typescript_ffi)

  // let assert Ok(_) = simplifile.write(to: out_path, contents: typescript_ffi)

  Ok(Nil)
}
