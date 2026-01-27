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
namespace my_strassen_MatrixMultiplication_addqtvc
noncomputable def mdl {α : Type} [Inhabited α] (m : Matrix.matrix α) := MyMatrix.create (Matrix.rows m) (Matrix.columns m) (Matrix.elts m)
structure with_symb where
  phy : Matrix.matrix ℤ
  sym : Symb.expr
axiom inhabited_axiom_with_symb : Inhabited with_symb
attribute [instance] inhabited_axiom_with_symb
noncomputable def with_symb_vld (env : Symb.env) (ws : with_symb) := Symb.e_mdl env (with_symb.sym ws) = mdl (with_symb.phy ws) ∧ Symb.e_vld env (with_symb.sym ws) ∧ Symb.expr.e_rows (with_symb.sym ws) = MyMatrix.rows (mdl (with_symb.phy ws)) ∧ Symb.expr.e_cols (with_symb.sym ws) = MyMatrix.cols (mdl (with_symb.phy ws))
theorem add'vc (a : Matrix.matrix ℤ) (b : Matrix.matrix ℤ) (fact0 : MyMatrix.infix_eqeqeq (mdl a) (mdl b)) : let o1 : ℤ := Matrix.columns a; let o2 : ℤ := Matrix.rows a; ((0 : ℤ) ≤ o2 ∧ (0 : ℤ) ≤ o1) ∧ (∀(res : Matrix.matrix ℤ), Matrix.rows res = o2 ∧ Matrix.columns res = o1 ∧ (∀(i : ℤ) (j : ℤ), ((0 : ℤ) ≤ i ∧ i < o2) ∧ (0 : ℤ) ≤ j ∧ j < o1 → Matrix.elts res i j = (0 : ℤ)) → (let o3 : ℤ := Matrix.rows a - (1 : ℤ); ((0 : ℤ) ≤ o3 + (1 : ℤ) → (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < (0 : ℤ) → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res i' j' = Matrix.elts a i' j' + Matrix.elts b i' j') ∧ (∀(res1 : Matrix.matrix ℤ), Matrix.rows res1 = Matrix.rows res ∧ Matrix.columns res1 = Matrix.columns res → (∀(i : ℤ), ((0 : ℤ) ≤ i ∧ i ≤ o3) ∧ (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res1 i' j' = Matrix.elts a i' j' + Matrix.elts b i' j') → (let o4 : ℤ := Matrix.columns a - (1 : ℤ); ((0 : ℤ) ≤ o4 + (1 : ℤ) → (∀(j' : ℤ), (0 : ℤ) ≤ j' ∧ j' < (0 : ℤ) → Matrix.elts res1 i j' = Matrix.elts a i j' + Matrix.elts b i j') ∧ (∀(res2 : Matrix.matrix ℤ), Matrix.rows res2 = Matrix.rows res1 ∧ Matrix.columns res2 = Matrix.columns res1 → (∀(j : ℤ), ((0 : ℤ) ≤ j ∧ j ≤ o4) ∧ (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res2 i' j' = Matrix.elts res1 i' j') ∧ (∀(j' : ℤ), (0 : ℤ) ≤ j' ∧ j' < j → Matrix.elts res2 i j' = Matrix.elts a i j' + Matrix.elts b i j') → Matrix.valid_index b i j ∧ Matrix.valid_index a i j ∧ Matrix.valid_index res2 i j ∧ (∀(res3 : Matrix.matrix ℤ), Matrix.rows res3 = Matrix.rows res2 ∧ Matrix.columns res3 = Matrix.columns res2 → Matrix.elts res3 = Function.update (Matrix.elts res2) i (Function.update (Matrix.elts res2 i) j (Matrix.elts a i j + Matrix.elts b i j)) → (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res3 i' j' = Matrix.elts res1 i' j') ∧ (∀(j' : ℤ), (0 : ℤ) ≤ j' ∧ j' < j + (1 : ℤ) → Matrix.elts res3 i j' = Matrix.elts a i j' + Matrix.elts b i j'))) ∧ ((∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res2 i' j' = Matrix.elts res1 i' j') ∧ (∀(j' : ℤ), (0 : ℤ) ≤ j' ∧ j' < o4 + (1 : ℤ) → Matrix.elts res2 i j' = Matrix.elts a i j' + Matrix.elts b i j') → (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i + (1 : ℤ) → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res2 i' j' = Matrix.elts a i' j' + Matrix.elts b i' j')))) ∧ (o4 + (1 : ℤ) < (0 : ℤ) → (∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < i + (1 : ℤ) → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res1 i' j' = Matrix.elts a i' j' + Matrix.elts b i' j')))) ∧ ((∀(i' : ℤ) (j' : ℤ), (0 : ℤ) ≤ i' ∧ i' < o3 + (1 : ℤ) → (0 : ℤ) ≤ j' ∧ j' < Matrix.columns a → Matrix.elts res1 i' j' = Matrix.elts a i' j' + Matrix.elts b i' j') → mdl res1 = MatrixArithmetic.add (mdl a) (mdl b) ∧ MyMatrix.infix_eqeqeq (mdl res1) (mdl a)))) ∧ (o3 + (1 : ℤ) < (0 : ℤ) → mdl res = MatrixArithmetic.add (mdl a) (mdl b) ∧ MyMatrix.infix_eqeqeq (mdl res) (mdl a))))
  := sorry
end my_strassen_MatrixMultiplication_addqtvc
