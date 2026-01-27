import Why3.Base
open Classical
open Lean4Why3
namespace cursor_examples_ArrayCursorImplqtimpl_cursorqtvc
theorem cursor'vc {α : Type} [Inhabited α] : let visited : List α := ([] : List α); let collection : List α := ([] : List α); ((0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ Int.ofNat (List.length collection)) ∧ (0 : ℤ) = Int.ofNat (List.length visited) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (0 : ℤ) → collection[Int.toNat i]! = visited[Int.toNat i]!)
  := sorry
end cursor_examples_ArrayCursorImplqtimpl_cursorqtvc
