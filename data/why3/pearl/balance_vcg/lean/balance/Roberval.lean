import Why3.Base
open Classical
open Lean4Why3
namespace Roberval
inductive outcome where
  | Left : outcome
  | Equal : outcome
  | Right : outcome
axiom inhabited_axiom_outcome : Inhabited outcome
attribute [instance] inhabited_axiom_outcome
axiom counter : Type
axiom inhabited_axiom_counter : Inhabited counter
attribute [instance] inhabited_axiom_counter
axiom v : counter -> ℤ
end Roberval
