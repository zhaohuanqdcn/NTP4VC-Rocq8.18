import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_mod_ie3qtvc
theorem ie3'vc (x : BitVec 32) (y : BitVec 32) (fact0 : x ≤ x + y) (fact1 : y ≤ x + y) : x ||| y ≤ x + y
  := sorry
end bitvector_examples_Hackers_delight_mod_ie3qtvc
