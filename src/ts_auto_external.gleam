import filepath
import gleam/io
import gleam/list
import simplifile
import ts_auto_external/config
import ts_auto_external/internal/lib

pub fn main() {
  generate_ffi_auto()
}

pub fn generate_ffi_auto() {
  let assert Ok(files) = simplifile.read_directory(lib.src())

  let matches = list.filter(files, config.match_pattern)

  io.println("")
  list.each(matches, fn(match) {
    io.println("found match: " <> match)

    let gleam_name = config.ts_to_gleam_extension(match)
    let out_path = filepath.join(config.default_out_dir(), gleam_name)

    let ts_path = filepath.join(lib.src(), match)
    let import_path = "../" <> match

    let res = generate_ffi(ts_path:, import_path:, out_path:)
    case res {
      Ok(_) -> {
        io.println("done: " <> out_path)
      }
      Error(_) -> {
        io.println("error: " <> out_path)
      }
    }
    io.println("")
  })
  io.println("")
}

pub type GenerateError {
  UnknownError(String)
}

@external(javascript, "./ts_morph_ffi.ts", "main")
fn ts_morph(sourcefile: String, import_path: String) -> String

fn generate_ffi(
  ts_path ts_path: String,
  import_path import_path: String,
  out_path out_path: String,
) -> Result(Nil, GenerateError) {
  let out_dir = filepath.directory_name(out_path)
  let _ = simplifile.create_directory_all(out_dir)

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
