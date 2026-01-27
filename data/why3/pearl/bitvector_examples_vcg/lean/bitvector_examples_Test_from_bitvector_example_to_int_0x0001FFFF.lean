import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_to_int_0x0001FFFF
theorem to_int_0x0001FFFF : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (15 : BitVec 32)) = (131071 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_to_int_0x0001FFFF
