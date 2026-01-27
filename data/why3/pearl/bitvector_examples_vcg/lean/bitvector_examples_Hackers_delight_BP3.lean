import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_BP3
theorem BP3 (a : BitVec 32) (x : BitVec 32) (b : BitVec 32) (c : BitVec 32) (y : BitVec 32) (d : BitVec 32) (fact0 : a ≤ x) (fact1 : x ≤ b) (fact2 : c ≤ y) (fact3 : y ≤ d) : ~~~b ≤ ~~~x ∧ ~~~x ≤ ~~~a
  := sorry
end bitvector_examples_Hackers_delight_BP3
