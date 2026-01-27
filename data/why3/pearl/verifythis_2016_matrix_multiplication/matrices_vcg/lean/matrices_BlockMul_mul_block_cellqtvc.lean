import Why3.Base
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MatrixArithmetic
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
open Classical
open Lean4Why3
namespace matrices_BlockMul_mul_block_cellqtvc
axiom ofs2 : MyMatrix.mat ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom ofs2'def (a : MyMatrix.mat ℤ) (ai : ℤ) (aj : ℤ) (i : ℤ) (j : ℤ) : ofs2 a ai aj i j = MyMatrix.get a (ai + i) (aj + j)
noncomputable def block (a : MyMatrix.mat ℤ) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) := MyMatrix.create dr dc (ofs2 a r c)
noncomputable def c_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.cols a1 ∧ MyMatrix.cols a1 ≤ MyMatrix.cols a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a) (0 : ℤ) (MyMatrix.cols a1) ∧ a2 = block a (0 : ℤ) (MyMatrix.rows a) (MyMatrix.cols a1) (MyMatrix.cols a - MyMatrix.cols a1)
noncomputable def r_blocks (a : MyMatrix.mat ℤ) (a1 : MyMatrix.mat ℤ) (a2 : MyMatrix.mat ℤ) := ((0 : ℤ) ≤ MyMatrix.rows a1 ∧ MyMatrix.rows a1 ≤ MyMatrix.rows a) ∧ a1 = block a (0 : ℤ) (MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a) ∧ a2 = block a (MyMatrix.rows a1) (MyMatrix.rows a - MyMatrix.rows a1) (0 : ℤ) (MyMatrix.cols a)
theorem mul_block_cell'vc (a : MyMatrix.mat ℤ) (b : MyMatrix.mat ℤ) (r : ℤ) (dr : ℤ) (c : ℤ) (dc : ℤ) (i : ℤ) (j : ℤ) (fact0 : MyMatrix.cols a = MyMatrix.rows b) (fact1 : (0 : ℤ) ≤ r) (fact2 : r + dr ≤ MyMatrix.rows a) (fact3 : (0 : ℤ) ≤ c) (fact4 : c + dc ≤ MyMatrix.cols b) (fact5 : (0 : ℤ) ≤ i) (fact6 : i < dr) (fact7 : (0 : ℤ) ≤ j) (fact8 : j < dc) : ofs2 (MatrixArithmetic.mul a b) r c i j = MyMatrix.get (MatrixArithmetic.mul (block a r dr (0 : ℤ) (MyMatrix.cols a)) (block b (0 : ℤ) (MyMatrix.rows b) c dc)) i j
  := sorry
end matrices_BlockMul_mul_block_cellqtvc
