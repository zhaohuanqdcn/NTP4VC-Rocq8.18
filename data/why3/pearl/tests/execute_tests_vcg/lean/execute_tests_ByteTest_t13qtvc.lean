import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_ByteTest_t13qtvc
theorem t13'vc : ¬(2 : ℤ) = (0 : ℤ) ∧ uint'8_in_bounds (Int.tdiv (24 : ℤ) (2 : ℤ)) ∧ (∀(o1 : BitVec 8), BitVec.toUInt o1 = Int.tdiv (24 : ℤ) (2 : ℤ) → uint'8_in_bounds ((42 : ℤ) + BitVec.toUInt o1) ∧ (∀(z : BitVec 8), BitVec.toUInt z = (42 : ℤ) + BitVec.toUInt o1 → uint'8_in_bounds (BitVec.toUInt z * (42 : ℤ)) ∧ (∀(w : BitVec 8), BitVec.toUInt w = BitVec.toUInt z * (42 : ℤ) → ¬(10 : ℤ) = (0 : ℤ) ∧ uint'8_in_bounds (Int.tmod (BitVec.toUInt w) (10 : ℤ)))))
  := sorry
end execute_tests_ByteTest_t13qtvc
