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
namespace my_strassen_MatrixMultiplication_block_wsqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem block_ws'vc (r : ℤ) (dr : ℤ) (a : Matrix.matrix ℤ) (c : ℤ) (dc : ℤ) (env1 : Symb.env) (fact0 : (0 : ℤ) ≤ r) (fact1 : r ≤ r + dr) (fact2 : r + dr ≤ MyMatrix.rows (mdl a)) (fact3 : (0 : ℤ) ≤ c) (fact4 : c ≤ c + dc) (fact5 : c + dc ≤ MyMatrix.cols (mdl a)) : (0 : ℤ) ≤ r ∧ r ≤ r + dr ∧ r + dr ≤ MyMatrix.rows (mdl a) ∧ (0 : ℤ) ≤ c ∧ c ≤ c + dc ∧ c + dc ≤ MyMatrix.cols (mdl a) ∧ (∀(m : Matrix.matrix ℤ), mdl m = BlockMul.block (mdl a) r dr c dc ∧ MyMatrix.rows (mdl m) = dr ∧ MyMatrix.cols (mdl m) = dc → (let o1 : MyMatrix.mat ℤ := mdl m; ∀(env : Symb.env), Symb.env.ev_c env = Symb.env.ev_c env1 + (1 : ℤ) ∧ Symb.env.ev_f env = Symb.extends1 (Symb.env.ev_f env1) (Symb.env.ev_c env1) o1 ∧ Symb.e_vld env (Symb.symb_mat o1 (Symb.env.ev_c env1)) → (let rm : MyMatrix.mat ℤ := mdl m; rm = BlockMul.block (mdl a) r dr c dc ∧ MyMatrix.rows rm = dr ∧ MyMatrix.cols rm = dc) ∧ Symb.symb_mat o1 (Symb.env.ev_c env1) = Symb.symb_mat (mdl m) (Symb.env.ev_c env1) ∧ Symb.env.ev_f env = Symb.extends1 (Symb.env.ev_f env1) (Symb.env.ev_c env1) (mdl m) ∧ Symb.env.ev_c env = Symb.env.ev_c env1 + (1 : ℤ) ∧ with_symb_vld env (with_symb.mk m (Symb.symb_mat o1 (Symb.env.ev_c env1)))))
  := sorry
end my_strassen_MatrixMultiplication_block_wsqtvc
