import Why3.Base
open Classical
open Lean4Why3
namespace MapPermut
noncomputable def permut {α : Type} [Inhabited α] (m1 : ℤ -> α) (m2 : ℤ -> α) (l : ℤ) (u : ℤ) := ∀(v : α), Lean4Why3.map_occ v m1 l u = Lean4Why3.map_occ v m2 l u
axiom permut_trans {α : Type} [Inhabited α] (a1 : ℤ -> α) (a2 : ℤ -> α) (l : ℤ) (u : ℤ) (a3 : ℤ -> α) (fact0 : permut a1 a2 l u) (fact1 : permut a2 a3 l u) : permut a1 a3 l u
axiom permut_exists {α : Type} [Inhabited α] (a1 : ℤ -> α) (a2 : ℤ -> α) (l : ℤ) (u : ℤ) (i : ℤ) (fact0 : permut a1 a2 l u) (fact1 : l ≤ i) (fact2 : i < u) : ∃(j : ℤ), (l ≤ j ∧ j < u) ∧ a1 j = a2 i
end MapPermut
