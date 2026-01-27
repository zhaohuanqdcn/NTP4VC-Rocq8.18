import Why3.Base
import Why3.map.MapInjection
import pearl.vacid_0_sparse_array_vcg.lean.vacid_0_sparse_array.SparseArray
open Classical
open Lean4Why3
namespace vacid_0_sparse_array_Harness_harnessqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom default : elt
axiom c1 : elt
axiom c2 : elt
theorem harness'vc : (0 : ℤ) ≤ (10 : ℤ) ∧ (10 : ℤ) ≤ (1000 : ℤ) ∧ (∀(a : SparseArray.sparse_array elt), SparseArray.card a = (0 : ℤ) ∧ SparseArray.def1 a = default ∧ SparseArray.length a = (10 : ℤ) → ((0 : ℤ) ≤ (20 : ℤ) ∧ (20 : ℤ) ≤ (1000 : ℤ)) ∧ (∀(b : SparseArray.sparse_array elt), SparseArray.card b = (0 : ℤ) ∧ SparseArray.def1 b = default ∧ SparseArray.length b = (20 : ℤ) → ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a) ∧ ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b) ∧ ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a) ∧ (∀(a1 : SparseArray.sparse_array elt), List.length (SparseArray.values a1) = List.length (SparseArray.values a) ∧ List.length (SparseArray.index a1) = List.length (SparseArray.index a) ∧ List.length (SparseArray.back a1) = List.length (SparseArray.back a) → SparseArray.def1 a = SparseArray.def1 a1 → SparseArray.value a1 (5 : ℤ) = c1 ∧ (∀(j : ℤ), ¬j = (5 : ℤ) → SparseArray.value a1 j = SparseArray.value a j) → ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b) ∧ (∀(b1 : SparseArray.sparse_array elt), List.length (SparseArray.values b1) = List.length (SparseArray.values b) ∧ List.length (SparseArray.index b1) = List.length (SparseArray.index b) ∧ List.length (SparseArray.back b1) = List.length (SparseArray.back b) → SparseArray.def1 b = SparseArray.def1 b1 → SparseArray.value b1 (7 : ℤ) = c2 ∧ (∀(j : ℤ), ¬j = (7 : ℤ) → SparseArray.value b1 j = SparseArray.value b j) → ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a1) ∧ ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b1) ∧ ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length a1) ∧ ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length b1) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < SparseArray.length a1) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < SparseArray.length b1))))
  := sorry
end vacid_0_sparse_array_Harness_harnessqtvc
