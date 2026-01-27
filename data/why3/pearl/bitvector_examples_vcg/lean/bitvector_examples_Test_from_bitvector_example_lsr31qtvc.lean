import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_lsr31qtvc
theorem lsr31'vc : (4294967295 : BitVec 32) >>> BitVec.toNat (31 : BitVec 32) = (1 : BitVec 32)
  := sorry
end bitvector_examples_Test_from_bitvector_example_lsr31qtvc
