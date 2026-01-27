import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_imperial_violet_to_int_uleqtvc
theorem to_int_ule'vc (b : BitVec 32) (c : BitVec 32) (fact0 : b ≤ c) : BitVec.toUInt b ≤ BitVec.toUInt c
  := sorry
end bitvector_examples_Test_imperial_violet_to_int_uleqtvc
