import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_lsr27qtvc
theorem lsr27'vc : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (27 : BitVec 32)) = (31 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_lsr27qtvc
