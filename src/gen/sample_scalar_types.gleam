import gleam/dynamic.{type Dynamic}

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "add")
pub fn add(x: Float, y: Float) -> Float

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "greet")
pub fn greet(name: String) -> String

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "append")
pub fn append(list: List(String), item: String) -> Nil

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "nuller")
pub fn nuller() -> Nil

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "undefiner")
pub fn undefiner() -> Nil

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "prom")
pub fn prom() -> Result(String, String)

@external(javascript, "../sample_scalar_types_ffi.auto.ts", "recorder")
pub fn recorder(obj: Dynamic) -> Nil
