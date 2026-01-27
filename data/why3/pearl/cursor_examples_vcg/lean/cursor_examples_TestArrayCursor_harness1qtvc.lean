import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.cursor_examples_vcg.lean.cursor_examples.ArrayCursorImpl
open Classical
open Lean4Why3
namespace cursor_examples_TestArrayCursor_harness1qtvc
theorem harness1'vc : (0 : ℤ) ≤ (42 : ℤ) ∧ (∀(a : List ℤ), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (42 : ℤ) → a[Int.toNat i]! = (0 : ℤ)) ∧ Int.ofNat (List.length a) = (42 : ℤ) → (∀(c : ArrayCursorImpl.cursor ℤ), ArrayCursorImpl.permitted c ∧ ArrayCursorImpl.visited c = ([] : List ℤ) ∧ ArrayCursorImpl.collection c = a → ¬ArrayCursorImpl.complete c ∧ ArrayCursorImpl.permitted c))
  := sorry
end cursor_examples_TestArrayCursor_harness1qtvc
