import Why3.Base
open Classical
open Lean4Why3
namespace R
structure r where
  x : BitVec 32
  y : BitVec 32
axiom inhabited_axiom_r : Inhabited r
attribute [instance] inhabited_axiom_r
end R
