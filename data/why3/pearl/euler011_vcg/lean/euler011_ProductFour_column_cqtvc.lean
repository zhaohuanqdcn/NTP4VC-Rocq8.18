import Why3.Base
import Why3.why3.Ref.Ref
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace euler011_ProductFour_column_cqtvc
inductive direction where
  | Left_bottom : direction
  | Right_bottom : direction
  | Bottom : direction
  | Right : direction
axiom inhabited_axiom_direction : Inhabited direction
attribute [instance] inhabited_axiom_direction
noncomputable def left_diag (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if i < Matrix.rows m ∧ (0 : ℤ) ≤ j ∧ (3 : ℤ) ≤ i ∧ j < Matrix.columns m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m (i - (1 : ℤ)) (j + (1 : ℤ)) * Matrix.elts m (i - (2 : ℤ)) (j + (2 : ℤ)) * Matrix.elts m (i - (3 : ℤ)) (j + (3 : ℤ))) else Option.none
noncomputable def right_diag (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if i < Matrix.rows m - (3 : ℤ) ∧ (0 : ℤ) ≤ i ∧ j < Matrix.columns m - (3 : ℤ) ∧ (0 : ℤ) ≤ j then Option.some (Matrix.elts m i j * Matrix.elts m (i + (1 : ℤ)) (j + (1 : ℤ)) * Matrix.elts m (i + (2 : ℤ)) (j + (2 : ℤ)) * Matrix.elts m (i + (3 : ℤ)) (j + (3 : ℤ))) else Option.none
noncomputable def line (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if ((0 : ℤ) ≤ j ∧ j < Matrix.columns m) ∧ (0 : ℤ) ≤ i ∧ i < Matrix.rows m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m (i + (1 : ℤ)) j * Matrix.elts m (i + (2 : ℤ)) j * Matrix.elts m (i + (3 : ℤ)) j) else Option.none
noncomputable def column (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) := if ((0 : ℤ) ≤ i ∧ i < Matrix.rows m) ∧ (0 : ℤ) ≤ j ∧ j < Matrix.columns m - (3 : ℤ) then Option.some (Matrix.elts m i j * Matrix.elts m i (j + (1 : ℤ)) * Matrix.elts m i (j + (2 : ℤ)) * Matrix.elts m i (j + (3 : ℤ))) else Option.none
theorem column_c'vc (i : ℤ) (m : Matrix.matrix ℤ) (j : ℤ) (o1 : Bool) (fact0 : if (0 : ℤ) ≤ i then if i < Matrix.rows m then if (0 : ℤ) ≤ j then o1 = (if j < Matrix.columns m - (3 : ℤ) then true else false) else o1 = false else o1 = false else o1 = false) : (o1 = true → Matrix.valid_index m i (j + (3 : ℤ)) ∧ Matrix.valid_index m i (j + (2 : ℤ)) ∧ Matrix.valid_index m i (j + (1 : ℤ)) ∧ Matrix.valid_index m i j) ∧ (∀(result : Option ℤ), (if o1 = true then result = Option.some (Matrix.elts m i j * Matrix.elts m i (j + (1 : ℤ)) * Matrix.elts m i (j + (2 : ℤ)) * Matrix.elts m i (j + (3 : ℤ))) else result = Option.none) → result = column m i j)
  := sorry
end euler011_ProductFour_column_cqtvc
