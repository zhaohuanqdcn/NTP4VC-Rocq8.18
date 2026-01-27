import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_Int31Test_t13qtvc
theorem t13'vc : ¬(2 : ℤ) = (0 : ℤ) ∧ int'31_in_bounds (Int.tdiv (24 : ℤ) (2 : ℤ)) ∧ (∀(o1 : BitVec 31), BitVec.toInt o1 = Int.tdiv (24 : ℤ) (2 : ℤ) → int'31_in_bounds ((42 : ℤ) + BitVec.toInt o1) ∧ (∀(z : BitVec 31), BitVec.toInt z = (42 : ℤ) + BitVec.toInt o1 → int'31_in_bounds (BitVec.toInt z * (42 : ℤ)) ∧ (∀(w : BitVec 31), BitVec.toInt w = BitVec.toInt z * (42 : ℤ) → (¬(10 : ℤ) = (0 : ℤ) ∧ int'31_in_bounds (Int.tmod (BitVec.toInt w) (10 : ℤ))) ∧ (∀(w1 : BitVec 31), BitVec.toInt w1 = Int.tmod (BitVec.toInt w) (10 : ℤ) → int'31_in_bounds (-BitVec.toInt w1)))))
  := sorry
end execute_tests_Int31Test_t13qtvc
