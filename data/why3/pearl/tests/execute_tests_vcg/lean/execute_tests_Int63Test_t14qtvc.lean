import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_Int63Test_t14qtvc
theorem t14'vc : int'63_in_bounds (42 : ℤ) ∧ (∀(x : BitVec 63), BitVec.toInt x = (42 : ℤ) → (let y : ℤ := BitVec.toInt x; int'63_in_bounds y ∧ (∀(o1 : BitVec 63), BitVec.toInt o1 = y → int'63_in_bounds (BitVec.toInt x + BitVec.toInt o1))))
  := sorry
end execute_tests_Int63Test_t14qtvc
