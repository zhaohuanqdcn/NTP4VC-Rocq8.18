import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_mod_bp2qtvc
theorem bp2'vc (a : BitVec 32) (x : BitVec 32) (b : BitVec 32) (c : BitVec 32) (y : BitVec 32) (d : BitVec 32) (fact0 : a ≤ x) (fact1 : x ≤ b) (fact2 : c ≤ y) (fact3 : y ≤ d) (fact4 : b ≤ b + d) (fact5 : d ≤ b + d) : let result : BitVec 32 := x ^^^ y; (0 : BitVec 32) ≤ result ∧ result ≤ b + d
  := sorry
end bitvector_examples_Hackers_delight_mod_bp2qtvc
