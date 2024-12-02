import filepath
import simplifile

/// Thank you https://github.com/giacomocavalieri/squirrel/blob/main/src/squirrel/internal/project.gleam
pub fn src() -> String {
  filepath.join(root(), "src")
}

/// Thank you https://github.com/giacomocavalieri/squirrel/blob/main/src/squirrel/internal/project.gleam
fn root() -> String {
  find_root(".")
}

/// Thank you https://github.com/giacomocavalieri/squirrel/blob/main/src/squirrel/internal/project.gleam
fn find_root(path: String) -> String {
  let toml = filepath.join(path, "gleam.toml")

  case simplifile.is_file(toml) {
    Ok(False) | Error(_) -> find_root(filepath.join("..", path))
    Ok(True) -> path
  }
}

pub fn defer(cleanup: fn() -> Nil, body: fn() -> a) -> a {
  let res = body()
  cleanup()
  res
}
