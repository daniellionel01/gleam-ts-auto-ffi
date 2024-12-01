import hexdocs_offline.{generate}
import hexdocs_offline/config.{default_config, with_output_path}

pub fn main() {
  let config =
    default_config()
    |> with_output_path("./hexdocs.html")

  generate(config)
}
