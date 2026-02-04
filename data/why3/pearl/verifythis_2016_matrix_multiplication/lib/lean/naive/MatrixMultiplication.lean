import Why3.Base
import Why3.int.Sum
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace MatrixMultiplication
axiom mul_atom : Matrix.matrix ℤ -> Matrix.matrix ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom mul_atom'def (a : Matrix.matrix ℤ) (b : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : mul_atom a b i j k = Matrix.elts a i k * Matrix.elts b k j
noncomputable def matrix_product (m : Matrix.matrix ℤ) (a : Matrix.matrix ℤ) (b : Matrix.matrix ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows m → (0 : ℤ) ≤ j ∧ j < Matrix.columns m → Matrix.elts m i j = int.Sum.sum (mul_atom a b i j) (0 : ℤ) (Matrix.columns a)
end MatrixMultiplication
