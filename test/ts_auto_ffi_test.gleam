import gleeunit
import gleeunit/should

import gen/scalar_types

pub fn main() {
  gleeunit.main()
}

pub fn sample_simple_test() {
  scalar_types.add(5.0, 8.0)
  |> should.equal(13.0)
}

pub fn map_types_test() {
  should.equal(1, 1)
  // todo as "simple scalar values"
  // todo as "more complex types (lists, records)"
  // todo as "custom types & interfaces"
  // todo as "classes w/ functions"
}
