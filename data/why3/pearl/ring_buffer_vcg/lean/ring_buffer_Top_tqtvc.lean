import Why3.Base
open Classical
open Lean4Why3
namespace ring_buffer_Top_tqtvc
theorem t'vc {α : Type} [Inhabited α] (o2 : α) : (0 : ℤ) ≤ (1 : ℤ) ∧ (∀(o1 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (1 : ℤ) → o1[Int.toNat i]! = o2) ∧ Int.ofNat (List.length o1) = (1 : ℤ) → (let contents : List α := ([] : List α); (0 : ℤ) < Int.ofNat (List.length o1) ∧ ((0 : ℤ) < Int.ofNat (List.length o1) → ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1)) ∧ ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length o1) → Int.ofNat (List.length contents) = (0 : ℤ) - (0 : ℤ) ∧ (Int.ofNat (List.length contents) = (0 : ℤ) - (0 : ℤ) → (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) - (0 : ℤ) → contents[Int.toNat i]! = o1[Int.toNat ((0 : ℤ) + i)]!))))))
  := sorry
end ring_buffer_Top_tqtvc
