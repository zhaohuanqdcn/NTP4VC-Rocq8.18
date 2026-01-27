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
namespace my_strassen_MatrixMultiplication_mul_naiveqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem mul_naive'vc : True
  := sorry
end my_strassen_MatrixMultiplication_mul_naiveqtvc
