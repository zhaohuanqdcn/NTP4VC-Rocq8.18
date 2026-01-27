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
namespace my_strassen_MatrixMultiplication_paddingqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem padding'vc (a : Matrix.matrix ℤ) (r : ℤ) (c : ℤ) (fact0 : MyMatrix.rows (mdl a) ≤ r) (fact1 : MyMatrix.cols (mdl a) ≤ c) : (0 : ℤ) ≤ r ∧ (0 : ℤ) ≤ c ∧ (∀(res : Matrix.matrix ℤ), Matrix.rows res = r ∧ Matrix.columns res = c ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < r) ∧ (0 : ℤ) ≤ j ∧ j < c → Matrix.elts res i j = (0 : ℤ)) → (let nr : ℤ := Matrix.rows a; let nc : ℤ := Matrix.columns a; (((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + nr ∧ (0 : ℤ) + nr ≤ Matrix.rows a) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + nc ∧ (0 : ℤ) + nc ≤ Matrix.columns a) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + nr ∧ (0 : ℤ) + nr ≤ Matrix.rows res) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) + nc ∧ (0 : ℤ) + nc ≤ Matrix.columns res) ∧ (∀(res1 : Matrix.matrix ℤ), Matrix.rows res1 = Matrix.rows res ∧ Matrix.columns res1 = Matrix.columns res → (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) + nr → (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + nc → Matrix.elts res1 i j = Matrix.elts a (i + ((0 : ℤ) - (0 : ℤ))) (j + ((0 : ℤ) - (0 : ℤ)))) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < Matrix.rows res1 → (0 : ℤ) ≤ j ∧ j < Matrix.columns res1 → ¬(((0 : ℤ) ≤ i ∧ i < (0 : ℤ) + nr) ∧ (0 : ℤ) ≤ j ∧ j < (0 : ℤ) + nc) → Matrix.elts res1 i j = Matrix.elts res i j) → MyMatrix.rows (mdl res1) = r ∧ MyMatrix.cols (mdl res1) = c ∧ mdl a = BlockMul.block (mdl res1) (0 : ℤ) (MyMatrix.rows (mdl a)) (0 : ℤ) (MyMatrix.cols (mdl a)) ∧ (let dr : ℤ := r - MyMatrix.rows (mdl a); MyMatrix.create dr (MyMatrix.cols (mdl a)) MatrixArithmetic.zerof = BlockMul.block (mdl res1) (MyMatrix.rows (mdl a)) dr (0 : ℤ) (MyMatrix.cols (mdl a))) ∧ (let dc : ℤ := c - MyMatrix.cols (mdl a); MyMatrix.create (MyMatrix.rows (mdl a)) dc MatrixArithmetic.zerof = BlockMul.block (mdl res1) (0 : ℤ) (MyMatrix.rows (mdl a)) (MyMatrix.cols (mdl a)) dc))))
  := sorry
end my_strassen_MatrixMultiplication_paddingqtvc
