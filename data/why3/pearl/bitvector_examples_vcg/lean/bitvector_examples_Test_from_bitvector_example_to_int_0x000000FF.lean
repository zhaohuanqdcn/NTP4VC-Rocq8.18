import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_to_int_0x000000FF
theorem to_int_0x000000FF : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (24 : BitVec 32)) = (255 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_to_int_0x000000FF
