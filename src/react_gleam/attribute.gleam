// Much of this code was lifted from 
// https://github.com/hayleigh-dot-dev/gleam-lustre
// Thank you Hayleigh 💙

// IMPORTS --------------------------------------------------------------------

import gleam/dynamic.{Dynamic}

// TYPES ----------------------------------------------------------------------

pub opaque type Attribute(action) {
  Attribute(name: String, value: String)
  Property(name: String, value: Dynamic)
  Event(name: String, handler: fn(Dynamic, fn(action) -> Nil) -> Nil)
}

// CONSTRUCTORS ---------------------------------------------------------------

pub fn attribute(name: String, value: String) -> Attribute(action) {
  Attribute(name, value)
}

pub fn property(name: String, value: Dynamic) -> Attribute(action) {
  Property(name, value)
}

pub fn event(
  name: String,
  handler: fn(Dynamic, fn(action) -> Nil) -> Nil,
) -> Attribute(action) {
  Event(name, handler)
}
