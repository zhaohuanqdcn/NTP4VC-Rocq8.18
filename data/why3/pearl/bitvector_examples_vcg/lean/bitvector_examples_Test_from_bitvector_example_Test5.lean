import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_Test5
theorem Test5 : (BitVec.sshiftRight (4294967295 : BitVec 32) (BitVec.toNat (16 : BitVec 32)))[BitVec.toNat (16 : BitVec 32)]! = true
  := sorry
end bitvector_examples_Test_from_bitvector_example_Test5
