import Why3.Base
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MatrixArithmetic
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
open Classical
open Lean4Why3
namespace matrices_BlockMul_block_mul_ijqtvc
axiom ofs2 : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : MyMatrix.mat ℤ) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = MyMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : MyMatrix.mat ℤ) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := MyMatrix.create dr dc (ofs2 a r c)
noncomputable def c_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.cols a1 ∧ MyMatrix.cols a1 ≤ MyMatrix.cols a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a) (0 : ℤ) (MyMatrix.cols a1) ∧ a2 = block a (0 : ℤ) (MyMatrix.rows a) (MyMatrix.cols a1) (MyMatrix.cols a - MyMatrix.cols a1)
noncomputable def r_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.rows a1 ∧ MyMatrix.rows a1 ≤ MyMatrix.rows a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a) ∧ a2 = block a (MyMatrix.rows a1) (MyMatrix.rows a - MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a)
theorem block_mul_ij'vc (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (b1 : MyMatrix.mat ℤ) (k : ℤ) (a2 : MyMatrix.mat ℤ) (b2 : MyMatrix.mat ℤ) (fact0 : MyMatrix.cols a = MyMatrix.rows b) (fact1 : MyMatrix.cols a1 = MyMatrix.rows b1) (fact2 : (0 : ℤ) ≤ k) (fact3 : k ≤ MyMatrix.cols a) (fact4 : c_blocks a a1 a2) (fact5 : r_blocks b b1 b2) : (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < MyMatrix.rows a → (0 : ℤ) ≤ j ∧ j < MyMatrix.cols b → (0 : ℤ) ≤ k ∧ k ≤ MyMatrix.cols a1 → int.Sum.sum (MatrixArithmetic.mul_atom a b i j) (0 : ℤ) k = int.Sum.sum (MatrixArithmetic.mul_atom a1 b1 i j) (0 : ℤ) k) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < MyMatrix.rows a → (0 : ℤ) ≤ j ∧ j < MyMatrix.cols b → MyMatrix.cols a1 ≤ k ∧ k ≤ MyMatrix.cols a → int.Sum.sum (MatrixArithmetic.mul_atom a b i j) (0 : ℤ) k = int.Sum.sum (MatrixArithmetic.mul_atom a1 b1 i j) (0 : ℤ) (MyMatrix.cols a1) + int.Sum.sum (MatrixArithmetic.mul_atom a2 b2 i j) (0 : ℤ) (k - MyMatrix.cols a1))
  := sorry
end matrices_BlockMul_block_mul_ijqtvc
