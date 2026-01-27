import Why3.Base
open Classical
open Lean4Why3
namespace vacid_0_sparse_array_SparseArray_sparse_arrayqtvc
theorem sparse_array'vc {α : Type} [Inhabited α] : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o1) = (0 : ℤ) → (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o2 : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o2[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length o2) = (0 : ℤ) → (∀(o3 : α), (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o4 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o4[Int.toNat i]! = o3) ∧ Int.ofNat (List.length o4) = (0 : ℤ) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o4) ∧ Int.ofNat (List.length o4) ≤ (1000 : ℤ)) ∧ (List.length o4 = List.length o2 ∧ List.length o2 = List.length o1) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → ((0 : ℤ) ≤ o1[Int.toNat i]! ∧ o1[Int.toNat i]! < Int.ofNat (List.length o4)) ∧ o2[Int.toNat (o1[Int.toNat i]!)]! = i)))))
  := sorry
end vacid_0_sparse_array_SparseArray_sparse_arrayqtvc
