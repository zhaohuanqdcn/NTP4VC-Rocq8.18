import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_to_int_0x000007FF
theorem to_int_0x000007FF : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (21 : BitVec 32)) = (2047 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_to_int_0x000007FF
