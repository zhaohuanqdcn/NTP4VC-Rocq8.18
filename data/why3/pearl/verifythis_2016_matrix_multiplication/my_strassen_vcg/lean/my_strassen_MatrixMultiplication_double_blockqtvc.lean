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
namespace my_strassen_MatrixMultiplication_double_blockqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem double_block'vc (r1 : ℤ) (dr1 : ℤ) (a : Matrix.matrix ℤ) (c1 : ℤ) (dc1 : ℤ) (r2 : ℤ) (dr2 : ℤ) (c2 : ℤ) (dc2 : ℤ) (fact0 : (0 : ℤ) ≤ r1) (fact1 : r1 ≤ r1 + dr1) (fact2 : r1 + dr1 ≤ MyMatrix.rows (mdl a)) (fact3 : (0 : ℤ) ≤ c1) (fact4 : c1 ≤ c1 + dc1) (fact5 : c1 + dc1 ≤ MyMatrix.cols (mdl a)) (fact6 : (0 : ℤ) ≤ r2) (fact7 : r2 ≤ r2 + dr2) (fact8 : r2 + dr2 ≤ dr1) (fact9 : (0 : ℤ) ≤ c2) (fact10 : c2 ≤ c2 + dc2) (fact11 : c2 + dc2 ≤ dc1) : BlockMul.block (BlockMul.block (mdl a) r1 dr1 c1 dc1) r2 dr2 c2 dc2 = BlockMul.block (mdl a) (r1 + r2) dr2 (c1 + c2) dc2
  := sorry
end my_strassen_MatrixMultiplication_double_blockqtvc
