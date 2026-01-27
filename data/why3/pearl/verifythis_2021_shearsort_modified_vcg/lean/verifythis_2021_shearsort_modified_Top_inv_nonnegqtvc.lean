import Why3.Base
import Why3.int.NumOf
import Why3.int.Sum
import Why3.matrix.Matrix
open Classical
open Lean4Why3
namespace verifythis_2021_shearsort_modified_Top_inv_nonnegqtvc
axiom fc : ℤ -> Matrix.matrix ℤ -> ℤ -> ℤ
axiom fc'def (x : ℤ) (m : Matrix.matrix ℤ) (i : ℤ) : fc x m i = Int.ofNat (Lean4Why3.map_occ x (Matrix.elts m i) (0 : ℤ) (Matrix.columns m))
noncomputable def mocc (x : ℤ) (m : Matrix.matrix ℤ) := int.Sum.sum (fc x m) (0 : ℤ) (Matrix.rows m)
noncomputable def lt (i : ℤ) (j : ℤ) (k : ℤ) (l : ℤ) := i < k ∨ i = k ∧ (if Int.tmod i (2 : ℤ) = (0 : ℤ) then j < l else l < j)
noncomputable def snake_order (m : Matrix.matrix ℤ) := let rw : ℤ := Matrix.rows m; let cl : ℤ := Matrix.columns m; ∀(i : ℤ) (j : ℤ) (k : ℤ) (l : ℤ), (0 : ℤ) ≤ i ∧ i < rw → (0 : ℤ) ≤ j ∧ j < cl → (0 : ℤ) ≤ k ∧ k < rw → (0 : ℤ) ≤ l ∧ l < cl → lt i j k l → Matrix.elts m i j ≤ Matrix.elts m k l
axiom fc1 : Matrix.matrix ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> Bool
axiom fc2 : Matrix.matrix ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom fc3 : Matrix.matrix ℤ -> ℤ -> ℤ -> ℤ
axiom fc4 : Matrix.matrix ℤ -> ℤ -> ℤ
axiom fc'def1 (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) (k : ℤ) (l : ℤ) : (fc1 m i j k l = true) = (lt i j k l ∧ Matrix.elts m k l < Matrix.elts m i j)
axiom fc'def2 (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) (k : ℤ) : fc2 m i j k = NumOf.numof (fc1 m i j k) (0 : ℤ) (Matrix.columns m)
axiom fc'def3 (m : Matrix.matrix ℤ) (i : ℤ) (j : ℤ) : fc3 m i j = int.Sum.sum (fc2 m i j) (0 : ℤ) (Matrix.rows m)
axiom fc'def4 (m : Matrix.matrix ℤ) (i : ℤ) : fc4 m i = int.Sum.sum (fc3 m i) (0 : ℤ) (Matrix.columns m)
noncomputable def inversions (m : Matrix.matrix ℤ) := int.Sum.sum (fc4 m) (0 : ℤ) (Matrix.rows m)
theorem inv_nonneg'vc (m : Matrix.matrix ℤ) : (0 : ℤ) ≤ inversions m
  := sorry
end verifythis_2021_shearsort_modified_Top_inv_nonnegqtvc
