import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_imperial_violet_bv32_bounds_bvqtvc
theorem bv32_bounds_bv'vc (b : BitVec 32) : (0 : BitVec 32) ≤ b ∧ b ≤ (4294967295 : BitVec 32)
  := sorry
end bitvector_examples_Test_imperial_violet_bv32_bounds_bvqtvc
