pub fn defer(cleanup: fn() -> Nil, body: fn() -> a) -> a {
  let res = body()
  cleanup()
  res
}
