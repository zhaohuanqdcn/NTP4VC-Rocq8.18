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
namespace my_strassen_MatrixMultiplication_sub_wsqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem sub_ws'vc (a : with_symb) (b : with_symb) (env : Symb.env) (fact0 : MyMatrix.infix_eqeqeq (mdl (with_symb.phy a)) (mdl (with_symb.phy b))) (fact1 : with_symb_vld env a) (fact2 : with_symb_vld env b) : let o1 : Symb.expr := with_symb.sym b; let o2 : Symb.expr := with_symb.sym a; ((Symb.e_vld env o2 ∧ Symb.e_vld env o1) ∧ Symb.expr.e_rows o2 = Symb.expr.e_rows o1 ∧ Symb.expr.e_cols o2 = Symb.expr.e_cols o1) ∧ (Symb.e_vld env (Symb.symb_sub o2 o1) ∧ Symb.e_mdl env (Symb.symb_sub o2 o1) = MatrixArithmetic.sub (Symb.e_mdl env o2) (Symb.e_mdl env o1) → (let o3 : Matrix.matrix ℤ := with_symb.phy b; let o4 : Matrix.matrix ℤ := with_symb.phy a; MyMatrix.infix_eqeqeq (mdl o4) (mdl o3) ∧ (∀(o5 : Matrix.matrix ℤ), mdl o5 = MatrixArithmetic.sub (mdl o4) (mdl o3) ∧ MyMatrix.infix_eqeqeq (mdl o5) (mdl o4) → mdl o5 = MatrixArithmetic.sub (mdl (with_symb.phy a)) (mdl (with_symb.phy b)) ∧ Symb.symb_sub o2 o1 = Symb.symb_sub (with_symb.sym a) (with_symb.sym b) ∧ with_symb_vld env (with_symb.mk o5 (Symb.symb_sub o2 o1)))))
  := sorry
end my_strassen_MatrixMultiplication_sub_wsqtvc
