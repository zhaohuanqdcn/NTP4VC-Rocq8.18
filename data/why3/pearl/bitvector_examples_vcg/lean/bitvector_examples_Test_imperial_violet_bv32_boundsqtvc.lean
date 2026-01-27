import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_imperial_violet_bv32_boundsqtvc
theorem bv32_bounds'vc (b : BitVec 32) : (0 : ℤ) ≤ BitVec.toUInt b ∧ BitVec.toUInt b < (4294967296 : ℤ)
  := sorry
end bitvector_examples_Test_imperial_violet_bv32_boundsqtvc
