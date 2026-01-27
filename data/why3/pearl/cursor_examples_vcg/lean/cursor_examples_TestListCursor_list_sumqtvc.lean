import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.cursor_examples_vcg.lean.cursor_examples.ListCursorImpl
open Classical
open Lean4Why3
namespace cursor_examples_TestListCursor_list_sumqtvc
axiom get_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom get_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : get_closure y y1 = y[Int.toNat y1]!
theorem list_sum'vc (c : ListCursorImpl.cursor ℤ) (l : List ℤ) (fact0 : ListCursorImpl.permitted c) (fact1 : ListCursorImpl.visited c = ([] : List ℤ)) (fact2 : ListCursorImpl.collection c = l) : (0 : ℤ) = int.Sum.sum (get_closure (ListCursorImpl.visited c)) (0 : ℤ) (Int.ofNat (List.length (ListCursorImpl.visited c))) ∧ ListCursorImpl.permitted c ∧ (∀(c1 : ListCursorImpl.cursor ℤ), ListCursorImpl.collection c1 = ListCursorImpl.collection c → ListCursorImpl.permitted c1 → ListCursorImpl.permitted c1 ∧ (if ¬ListCursorImpl.complete c1 then (¬ListCursorImpl.complete c1 ∧ ListCursorImpl.permitted c1) ∧ (∀(c2 : ListCursorImpl.cursor ℤ), ListCursorImpl.collection c2 = ListCursorImpl.collection c1 → (∀(x : ℤ), ListCursorImpl.visited c2 = ListCursorImpl.visited c1 ++ [x] ∧ ListCursorImpl.permitted c2 → ((0 : ℤ) ≤ Int.ofNat (List.length l) - Int.ofNat (List.length (ListCursorImpl.visited c1)) ∧ Int.ofNat (List.length l) - Int.ofNat (List.length (ListCursorImpl.visited c2)) < Int.ofNat (List.length l) - Int.ofNat (List.length (ListCursorImpl.visited c1))) ∧ int.Sum.sum (get_closure (ListCursorImpl.visited c1)) (0 : ℤ) (Int.ofNat (List.length (ListCursorImpl.visited c1))) + x = int.Sum.sum (get_closure (ListCursorImpl.visited c2)) (0 : ℤ) (Int.ofNat (List.length (ListCursorImpl.visited c2))) ∧ ListCursorImpl.permitted c2)) else int.Sum.sum (get_closure (ListCursorImpl.visited c1)) (0 : ℤ) (Int.ofNat (List.length (ListCursorImpl.visited c1))) = List.sum l))
  := sorry
end cursor_examples_TestListCursor_list_sumqtvc
