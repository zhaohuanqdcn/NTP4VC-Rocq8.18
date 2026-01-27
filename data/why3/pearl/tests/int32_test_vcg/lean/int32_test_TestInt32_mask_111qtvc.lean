import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace int32_test_TestInt32_mask_111qtvc
theorem mask_111'vc (o1 : BitVec 32) (x : BitVec 32) (result : BitVec 32) (fact0 : BitVec.toUInt o1 = BitVec.toInt x) (fact1 : BitVec.toInt result = BitVec.toUInt (o1 &&& BitVec.ofInt 32 (7 : ℤ))) : (0 : ℤ) ≤ BitVec.toInt result ∧ BitVec.toInt result < (8 : ℤ)
  := sorry
end int32_test_TestInt32_mask_111qtvc
