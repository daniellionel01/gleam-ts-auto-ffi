# TODO

## Functionality
- [ ] custom config w/ custom config & out directory
- [ ] annotate function / type / interface w/ comment for automatic detection
- [ ] annotate automatically generated files (w/ hint that it's auto generated and should not be edited)
- [ ] automatically read out all .ts files
  - [ ] config w/ custom pattern (default: "*_ffi.auto.ts")
- [ ] map types
  - [ ] generics?
  - [ ] scalar values
  - [ ] nullish values (void, null, undefined, never)
  - [ ] optional as gleam/option
  - [ ] array, record
  - [ ] class
  - [ ] custom interface, type
  - [ ] literals
  - [ ] "or"s (string *or* number *or* ...)
  - [ ] any
  - [ ] promise -> result
    - [ ] but what error type?

## Codebase
- [ ] alternative package name (not ..._ffi)
- [ ] test suite
- [ ] error handling
  - [ ] remove asserts where available

## Documentation
- [ ] readme - disclaimers
  - [ ] javascript target (obviously)
- [ ] readme - usage
  - [ ] "*_ffi.auto.ts" extension
- [ ] readme - acknowledgements
- [ ] readme - provide typescript <> gleam type mapping
- [ ] example repos - runtimes
  - [ ] node
  - [ ] deno
  - [ ] bun
- [ ] example repos - npm libs
  - [ ] playwright
  - [ ] drizzle

## Backlog & Ideas
- [ ] jsdocs
- [ ] types only version that only imports types, interfaces & classes
