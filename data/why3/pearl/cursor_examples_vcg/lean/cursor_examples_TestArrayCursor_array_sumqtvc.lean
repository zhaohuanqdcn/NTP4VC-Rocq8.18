import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.cursor_examples_vcg.lean.cursor_examples.ArrayCursorImpl
open Classical
open Lean4Why3
namespace cursor_examples_TestArrayCursor_array_sumqtvc
axiom get_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom mixfix_lbrb_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom get_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : get_closure y y1 = y[Int.toNat y1]!
axiom mixfix_lbrb_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : mixfix_lbrb_closure y y1 = y[Int.toNat y1]!
theorem array_sum'vc (c : ArrayCursorImpl.cursor ℤ) (a : List ℤ) (fact0 : ArrayCursorImpl.permitted c) (fact1 : ArrayCursorImpl.visited c = ([] : List ℤ)) (fact2 : ArrayCursorImpl.collection c = a) : (0 : ℤ) = int.Sum.sum (get_closure (ArrayCursorImpl.visited c)) (0 : ℤ) (Int.ofNat (List.length (ArrayCursorImpl.visited c))) ∧ ArrayCursorImpl.permitted c ∧ (∀(c1 : ArrayCursorImpl.cursor ℤ), ArrayCursorImpl.collection c1 = ArrayCursorImpl.collection c → ArrayCursorImpl.permitted c1 → ArrayCursorImpl.permitted c1 ∧ (if ¬ArrayCursorImpl.complete c1 then (¬ArrayCursorImpl.complete c1 ∧ ArrayCursorImpl.permitted c1) ∧ (∀(c2 : ArrayCursorImpl.cursor ℤ), ArrayCursorImpl.collection c2 = ArrayCursorImpl.collection c1 → (∀(x : ℤ), ArrayCursorImpl.visited c2 = ArrayCursorImpl.visited c1 ++ [x] ∧ ArrayCursorImpl.permitted c2 → ((0 : ℤ) ≤ Int.ofNat (List.length (ArrayCursorImpl.collection c1)) - Int.ofNat (List.length (ArrayCursorImpl.visited c1)) ∧ Int.ofNat (List.length (ArrayCursorImpl.collection c2)) - Int.ofNat (List.length (ArrayCursorImpl.visited c2)) < Int.ofNat (List.length (ArrayCursorImpl.collection c1)) - Int.ofNat (List.length (ArrayCursorImpl.visited c1))) ∧ int.Sum.sum (get_closure (ArrayCursorImpl.visited c1)) (0 : ℤ) (Int.ofNat (List.length (ArrayCursorImpl.visited c1))) + x = int.Sum.sum (get_closure (ArrayCursorImpl.visited c2)) (0 : ℤ) (Int.ofNat (List.length (ArrayCursorImpl.visited c2))) ∧ ArrayCursorImpl.permitted c2)) else int.Sum.sum (get_closure (ArrayCursorImpl.visited c1)) (0 : ℤ) (Int.ofNat (List.length (ArrayCursorImpl.visited c1))) = int.Sum.sum (mixfix_lbrb_closure a) (0 : ℤ) (Int.ofNat (List.length a))))
  := sorry
end cursor_examples_TestArrayCursor_array_sumqtvc
