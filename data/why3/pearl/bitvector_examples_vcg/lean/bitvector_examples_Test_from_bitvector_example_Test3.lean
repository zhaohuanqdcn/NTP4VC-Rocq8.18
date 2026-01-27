import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_Test3
theorem Test3 : ((4294967295 : BitVec 32) >>> BitVec.toNat (16 : BitVec 32))[BitVec.toNat (16 : BitVec 32)]! = false
  := sorry
end bitvector_examples_Test_from_bitvector_example_Test3
