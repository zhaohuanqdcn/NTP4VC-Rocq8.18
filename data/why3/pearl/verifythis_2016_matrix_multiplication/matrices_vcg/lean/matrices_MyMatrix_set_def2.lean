import Why3.Base
open Classical
open Lean4Why3
namespace matrices_MyMatrix_set_def2
axiom mat : Type -> Type
axiom inhabited_axiom_mat {α : Type} [Inhabited α] : Inhabited (mat α)
attribute [instance] inhabited_axiom_mat
axiom rows :  {α : Type} -> [Inhabited α] -> mat α -> ℤ
axiom cols :  {α : Type} -> [Inhabited α] -> mat α -> ℤ
axiom get :  {α : Type} -> [Inhabited α] -> mat α -> ℤ -> ℤ -> α
axiom create :  {α : Type} -> [Inhabited α] -> ℤ -> ℤ -> (ℤ -> ℤ -> α) -> mat α
axiom create_rows {α : Type} [Inhabited α] (r : ℤ) (c : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ r) : rows (create r c f) = r
axiom create_cols {α : Type} [Inhabited α] (c : ℤ) (r : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ c) : cols (create r c f) = c
axiom create_get {α : Type} [Inhabited α] (i : ℤ) (r : ℤ) (j : ℤ) (c : ℤ) (f : ℤ -> ℤ -> α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < r) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < c) : get (create r c f) i j = f i j
axiom fc :  {α : Type} -> [Inhabited α] -> mat α -> ℤ -> ℤ -> α -> ℤ -> ℤ -> α
axiom fc'def {α : Type} [Inhabited α] (m : mat α) (x : ℤ) (y : ℤ) (z : α) (x1 : ℤ) (y1 : ℤ) : fc m x y z x1 y1 = (if x1 = x ∧ y1 = y then z else get m x1 y1)
noncomputable def set {α : Type} [Inhabited α] (m : mat α) (x : ℤ) (y : ℤ) (z : α) := create (rows m) (cols m) (fc m x y z)
axiom rows_and_cols_nonnegative {α : Type} [Inhabited α] (m : mat α) : (0 : ℤ) ≤ rows m ∧ (0 : ℤ) ≤ cols m
axiom set_def1 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) : rows (set m i j v) = rows m
theorem set_def2 {α : Type} [Inhabited α] (i : ℤ) (m : mat α) (j : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < rows m) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < cols m) : cols (set m i j v) = cols m
  := sorry
end matrices_MyMatrix_set_def2
