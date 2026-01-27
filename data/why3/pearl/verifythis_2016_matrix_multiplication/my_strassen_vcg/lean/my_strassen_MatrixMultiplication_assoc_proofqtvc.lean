import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MyMatrix
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.MatrixArithmetic
import pearl.verifythis_2016_matrix_multiplication.lib.lean.sum_extended.Sum_extended
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices.BlockMul
import pearl.verifythis_2016_matrix_multiplication.lib.lean.matrices_ring_simp.Symb
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace my_strassen_MatrixMultiplication_assoc_proofqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem assoc_proof'vc (a : Matrix.matrix ℤ) (b : Matrix.matrix ℤ) (c : Matrix.matrix ℤ) (fact0 : MyMatrix.cols (mdl a) = MyMatrix.rows (mdl b)) (fact1 : MyMatrix.cols (mdl b) = MyMatrix.rows (mdl c)) : MyMatrix.cols (mdl a) = MyMatrix.rows (mdl b) ∧ (∀(ab : Matrix.matrix ℤ), MyMatrix.rows (mdl ab) = MyMatrix.rows (mdl a) ∧ MyMatrix.cols (mdl ab) = MyMatrix.cols (mdl b) ∧ mdl ab = MatrixArithmetic.mul (mdl a) (mdl b) → MyMatrix.cols (mdl b) = MyMatrix.rows (mdl c) ∧ (∀(bc : Matrix.matrix ℤ), MyMatrix.rows (mdl bc) = MyMatrix.rows (mdl b) ∧ MyMatrix.cols (mdl bc) = MyMatrix.cols (mdl c) ∧ mdl bc = MatrixArithmetic.mul (mdl b) (mdl c) → MyMatrix.cols (mdl ab) = MyMatrix.rows (mdl c) ∧ (∀(ab_c : Matrix.matrix ℤ), MyMatrix.rows (mdl ab_c) = MyMatrix.rows (mdl ab) ∧ MyMatrix.cols (mdl ab_c) = MyMatrix.cols (mdl c) ∧ mdl ab_c = MatrixArithmetic.mul (mdl ab) (mdl c) → MyMatrix.cols (mdl a) = MyMatrix.rows (mdl bc))))
  := sorry
end my_strassen_MatrixMultiplication_assoc_proofqtvc
