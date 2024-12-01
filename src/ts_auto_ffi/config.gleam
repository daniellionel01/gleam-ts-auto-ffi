import filepath
import gleam/string
import ts_auto_ffi/internal/lib

pub fn default_out_dir() {
  filepath.join(lib.src(), "gen")
}

pub fn default_pattern() {
  "_ffi.auto.ts"
}

pub fn match_pattern(str: String) {
  string.ends_with(str, default_pattern())
}

pub fn ts_to_gleam_extension(str: String) {
  string.replace(str, each: default_pattern(), with: ".gleam")
}
