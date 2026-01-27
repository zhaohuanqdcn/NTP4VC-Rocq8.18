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
namespace my_strassen_MatrixMultiplication_blockqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem block'vc (r : ℤ) (dr : ℤ) (a : Matrix.matrix ℤ) (c : ℤ) (dc : ℤ) (fact0 : (0 : ℤ) ≤ r) (fact1 : r ≤ r + dr) (fact2 : r + dr ≤ MyMatrix.rows (mdl a)) (fact3 : (0 : ℤ) ≤ c) (fact4 : c ≤ c + dc) (fact5 : c + dc ≤ MyMatrix.cols (mdl a)) : (0 : ℤ) ≤ dr ∧ (0 : ℤ) ≤ dc ∧ (∀(res : Matrix.matrix ℤ), Matrix.rows res = dr ∧ Matrix.columns res = dc ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < dr) ∧ (0 : ℤ) ≤ j ∧ j < dc → Matrix.elts res i j = (0 : ℤ)) → (((0 : ℤ) ≤ r ∧ r ≤ r + dr ∧ r + dr ≤ Matrix.rows a) ∧ ((0 : ℤ) ≤ c ∧ c ≤ c + dc ∧ c + dc ≤ Matrix.columns a) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + dr ∧ (0 : ℤ) + dr ≤ Matrix.rows res) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + dc ∧ (0 : ℤ) + dc ≤ Matrix.columns res) ∧ (∀(res1 : Matrix.matrix ℤ), Matrix.rows res1 = Matrix.rows res ∧ Matrix.columns res1 = Matrix.columns res → (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + dr → (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + dc → Matrix.elts res1 i j = Matrix.elts a (i + (r - (0 : ℤ))) (j + (c - (0 : ℤ)))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res1 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res1 → ¬(((0 : ℤ) ≤ i ∧ i < (0 : ℤ) + dr) ∧ (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + dc) → Matrix.elts res1 i j = Matrix.elts res i j) → mdl res1 = BlockMul.block (mdl a) r dr c dc ∧ MyMatrix.rows (mdl res1) = dr ∧ MyMatrix.cols (mdl res1) = dc))
  := sorry
end my_strassen_MatrixMultiplication_blockqtvc
