import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_IE1
theorem IE1 (x : BitVec 32) (y : BitVec 32) : x ^^^ y ≤ x ||| y
  := sorry
end bitvector_examples_Hackers_delight_IE1
