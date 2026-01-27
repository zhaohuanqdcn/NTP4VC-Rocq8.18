import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_ByteTest_t14qtvc
theorem t14'vc : uint'8_in_bounds (42 : ℤ) ∧ (∀(x : BitVec 8), BitVec.toUInt x = (42 : ℤ) → (let y : ℤ := BitVec.toUInt x; uint'8_in_bounds y ∧ (∀(o1 : BitVec 8), BitVec.toUInt o1 = y → uint'8_in_bounds (BitVec.toUInt x + BitVec.toUInt o1))))
  := sorry
end execute_tests_ByteTest_t14qtvc
