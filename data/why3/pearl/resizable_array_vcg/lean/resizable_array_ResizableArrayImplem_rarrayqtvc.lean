import Why3.Base
open Classical
open Lean4Why3
namespace resizable_array_ResizableArrayImplem_rarrayqtvc
theorem rarray'vc {α : Type} [Inhabited α] (o2 : α) : (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(o1 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → o1[Int.toNat i]! = o2) ∧ Int.ofNat (List.length o1) = (0 : ℤ) → (∀(o3 : α), ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1) → o1[Int.toNat i]! = o3))))
  := sorry
end resizable_array_ResizableArrayImplem_rarrayqtvc
