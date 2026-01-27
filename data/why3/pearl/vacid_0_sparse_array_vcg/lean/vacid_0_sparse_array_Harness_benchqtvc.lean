import Why3.Base
import Why3.map.MapInjection
import pearl.vacid_0_sparse_array_vcg.lean.vacid_0_sparse_array.SparseArray
open Classical
open Lean4Why3
namespace vacid_0_sparse_array_Harness_benchqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom default : elt
axiom c1 : elt
axiom c2 : elt
axiom infix_exeq : elt -> elt -> Prop
axiom infix_exeq'spec (x : elt) (y : elt) : infix_exeq x y = (¬x = y)
theorem bench'vc : (0 : ℤ) ≤ (10 : ℤ) ∧ (10 : ℤ) ≤ (1000 : ℤ) ∧ (∀(a : SparseArray.sparse_array elt), SparseArray.card a = (0 : ℤ) ∧ SparseArray.def1 a = default ∧ SparseArray.length a = (10 : ℤ) → ((0 : ℤ) ≤ (20 : ℤ) ∧ (20 : ℤ) ≤ (1000 : ℤ)) ∧ (∀(b : SparseArray.sparse_array elt), SparseArray.card b = (0 : ℤ) ∧ SparseArray.def1 b = default ∧ SparseArray.length b = (20 : ℤ) → (let o1 : elt := default; ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a) ∧ (let o2 : elt := SparseArray.value a (5 : ℤ); infix_exeq o2 o1 = (¬o2 = o1) → ¬infix_exeq o2 o1 → (let o3 : elt := default; ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b) ∧ (let o4 : elt := SparseArray.value b (7 : ℤ); infix_exeq o4 o3 = (¬o4 = o3) → ¬infix_exeq o4 o3 → ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a) ∧ (∀(a1 : SparseArray.sparse_array elt), List.length (SparseArray.values a1) = List.length (SparseArray.values a) ∧ List.length (SparseArray.index a1) = List.length (SparseArray.index a) ∧ List.length (SparseArray.back a1) = List.length (SparseArray.back a) → SparseArray.def1 a = SparseArray.def1 a1 → SparseArray.value a1 (5 : ℤ) = c1 ∧ (∀(j : ℤ), ¬j = (5 : ℤ) → SparseArray.value a1 j = SparseArray.value a j) → ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b) ∧ (∀(b1 : SparseArray.sparse_array elt), List.length (SparseArray.values b1) = List.length (SparseArray.values b) ∧ List.length (SparseArray.index b1) = List.length (SparseArray.index b) ∧ List.length (SparseArray.back b1) = List.length (SparseArray.back b) → SparseArray.def1 b = SparseArray.def1 b1 → SparseArray.value b1 (7 : ℤ) = c2 ∧ (∀(j : ℤ), ¬j = (7 : ℤ) → SparseArray.value b1 j = SparseArray.value b j) → (let o5 : elt := c1; ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length a1) ∧ (let o6 : elt := SparseArray.value a1 (5 : ℤ); infix_exeq o6 o5 = (¬o6 = o5) → ¬infix_exeq o6 o5 → (let o7 : elt := c2; ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length b1) ∧ (let o8 : elt := SparseArray.value b1 (7 : ℤ); infix_exeq o8 o7 = (¬o8 = o7) → ¬infix_exeq o8 o7 → (let o9 : elt := default; ((0 : ℤ) ≤ (7 : ℤ) ∧ (7 : ℤ) < SparseArray.length a1) ∧ (let o10 : elt := SparseArray.value a1 (7 : ℤ); infix_exeq o10 o9 = (¬o10 = o9) → ¬infix_exeq o10 o9 → (let o11 : elt := default; ((0 : ℤ) ≤ (5 : ℤ) ∧ (5 : ℤ) < SparseArray.length b1) ∧ (let o12 : elt := SparseArray.value b1 (5 : ℤ); infix_exeq o12 o11 = (¬o12 = o11) → ¬infix_exeq o12 o11 → (let o13 : elt := default; ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < SparseArray.length a1) ∧ (let o14 : elt := SparseArray.value a1 (0 : ℤ); infix_exeq o14 o13 = (¬o14 = o13) → ¬infix_exeq o14 o13 → (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < SparseArray.length b1))))))))))))))))))
  := sorry
end vacid_0_sparse_array_Harness_benchqtvc
