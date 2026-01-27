import Why3.Base
open Classical
open Lean4Why3
namespace linear_probing_HashedTypeWithDummy_neqqtvc
axiom key : Type
axiom inhabited_axiom_key : Inhabited key
attribute [instance] inhabited_axiom_key
axiom keym : Type
axiom inhabited_axiom_keym : Inhabited keym
attribute [instance] inhabited_axiom_keym
axiom keym1 : key -> keym
axiom eq : key -> key -> Prop
axiom eq'spec (x : key) (y : key) : eq x y = (keym1 x = keym1 y)
theorem neq'vc (x : key) (y : key) (fact0 : eq x y = (keym1 x = keym1 y)) : (¬eq x y) = (¬keym1 x = keym1 y)
  := sorry
end linear_probing_HashedTypeWithDummy_neqqtvc
