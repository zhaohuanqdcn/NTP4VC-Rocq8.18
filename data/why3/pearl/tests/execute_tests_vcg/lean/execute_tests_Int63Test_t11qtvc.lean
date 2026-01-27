import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_Int63Test_t11qtvc
theorem t11'vc : int'63_in_bounds ((21 : ℤ) - (1 : ℤ)) ∧ (BitVec.toInt (20 : BitVec 63) = (21 : ℤ) - (1 : ℤ) → ((20 : ℤ) = BitVec.toInt (20 : BitVec 63) → True) → int'63_in_bounds ((21 : ℤ) - (1 : ℤ)))
  := sorry
end execute_tests_Int63Test_t11qtvc
