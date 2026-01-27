import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_to_int_0x0000FFFF
theorem to_int_0x0000FFFF : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (16 : BitVec 32)) = (65535 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_to_int_0x0000FFFF
