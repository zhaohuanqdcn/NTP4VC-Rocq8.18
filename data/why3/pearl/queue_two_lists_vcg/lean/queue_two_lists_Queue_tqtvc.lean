import Why3.Base
open Classical
open Lean4Why3
namespace queue_two_lists_Queue_tqtvc
theorem t'vc {α : Type} [Inhabited α] : ∃(front : List α) (rear : List α) (seq : List α), Int.ofNat (List.length seq) = Int.ofNat (List.length front) + Int.ofNat (List.length rear) ∧ ((0 : ℤ) < Int.ofNat (List.length front) → (0 : ℤ) < Int.ofNat (List.length rear)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length seq) → seq[Int.toNat i]! = (let n : ℤ := Int.ofNat (List.length rear); if i < n then rear[Int.toNat i]! else front[Int.toNat (Int.ofNat (List.length front) - (1 : ℤ) - (i - n))]!))
  := sorry
end queue_two_lists_Queue_tqtvc
