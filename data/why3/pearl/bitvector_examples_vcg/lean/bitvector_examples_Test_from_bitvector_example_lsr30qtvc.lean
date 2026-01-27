import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Test_from_bitvector_example_lsr30qtvc
theorem lsr30'vc : (4294967295 : BitVec 32) >>> BitVec.toNat (30 : BitVec 32) = (3 : BitVec 32)
  := sorry
end bitvector_examples_Test_from_bitvector_example_lsr30qtvc
