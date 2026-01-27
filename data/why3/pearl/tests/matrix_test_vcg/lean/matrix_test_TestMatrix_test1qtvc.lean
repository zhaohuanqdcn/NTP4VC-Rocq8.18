import Why3.Base
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace matrix_test_TestMatrix_test1qtvc
theorem test1'vc : (0 : ℤ) ≤ (3 : ℤ) ∧ (∀(m1 : Matrix.matrix ℤ), Matrix.rows m1 = (3 : ℤ) ∧ Matrix.columns m1 = (3 : ℤ) ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < (3 : ℤ)) ∧ (0 : ℤ) ≤ j ∧ j < (3 : ℤ) → Matrix.elts m1 i j = (2 : ℤ)) → Matrix.valid_index m1 (0 : ℤ) (0 : ℤ))
  := sorry
end matrix_test_TestMatrix_test1qtvc
