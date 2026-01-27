import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_to_int_0x000FFFFF
theorem to_int_0x000FFFFF : BitVec.toUInt ((4294967295 : BitVec 32) >>> BitVec.toNat (12 : BitVec 32)) = (1048575 : ℤ)
  := sorry
end bitvector_examples_Test_from_bitvector_example_to_int_0x000FFFFF
