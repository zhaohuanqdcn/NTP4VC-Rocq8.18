import Why3.Base
open Classical
open Lean4Why3
namespace Debug
structure t where
  foo : Unit
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
end Debug
