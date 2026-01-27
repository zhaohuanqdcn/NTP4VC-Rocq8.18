import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_ByteTest_t11qtvc
theorem t11'vc : uint'8_in_bounds ((21 : ℤ) - (1 : ℤ)) ∧ (BitVec.toUInt (20 : BitVec 8) = (21 : ℤ) - (1 : ℤ) → ((20 : ℤ) = BitVec.toUInt (20 : BitVec 8) → True) → uint'8_in_bounds ((21 : ℤ) - (1 : ℤ)))
  := sorry
end execute_tests_ByteTest_t11qtvc
