import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import Why3.cursor.Cursor
open Classical
open Lean4Why3
namespace cursor_examples_TestCursor_sumqtvc
axiom get_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom get_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : get_closure y y1 = y[Int.toNat y1]!
theorem sum'vc (c : Cursor.cursor ℤ) (fact0 : Cursor.permitted c) (fact1 : Cursor.visited c = ([] : List ℤ)) : Cursor.permitted c ∧ (0 : ℤ) = int.Sum.sum (get_closure (Cursor.visited c)) (0 : ℤ) (Int.ofNat (List.length (Cursor.visited c))) ∧ (∀(c1 : Cursor.cursor ℤ), Cursor.permitted c1 → Cursor.permitted c1 ∧ (if ¬Cursor.complete c1 then (¬Cursor.complete c1 ∧ Cursor.permitted c1) ∧ (∀(c2 : Cursor.cursor ℤ) (x : ℤ), Cursor.visited c2 = Cursor.visited c1 ++ [x] ∧ Cursor.permitted c2 → Cursor.permitted c2 ∧ int.Sum.sum (get_closure (Cursor.visited c1)) (0 : ℤ) (Int.ofNat (List.length (Cursor.visited c1))) + x = int.Sum.sum (get_closure (Cursor.visited c2)) (0 : ℤ) (Int.ofNat (List.length (Cursor.visited c2)))) else True))
  := sorry
end cursor_examples_TestCursor_sumqtvc
