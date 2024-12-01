# Gleam TypeScript Auto FFI

[![Package Version](https://img.shields.io/hexpm/v/ts_auto_ffi)](https://hex.pm/packages/ts_auto_ffi)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/ts_auto_ffi/)

## Usage
```sh
gleam add ts_auto_ffi@1
```
```gleam
import ts_auto_ffi

pub fn main() {
  // TODO: An example of the project in use
}
```

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

### Testing

To be able to run the test suite, you will first need to run the project (`gleam run`).
This is because we need the generated gleam ffi modules located in [src/gen](./src/gen)
