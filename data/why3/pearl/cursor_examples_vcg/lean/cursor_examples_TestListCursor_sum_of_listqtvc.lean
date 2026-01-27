import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Sum
import pearl.cursor_examples_vcg.lean.cursor_examples.ListCursorImpl
open Classical
open Lean4Why3
namespace cursor_examples_TestListCursor_sum_of_listqtvc
axiom get_closure :  {α : Type} -> [Inhabited α] -> List α -> ℤ -> α
axiom get_closure_def {α : Type} [Inhabited α] (y : List α) (y1 : ℤ) : get_closure y y1 = y[Int.toNat y1]!
theorem sum_of_list'vc (l : List ℤ) : List.sum l = int.Sum.sum (get_closure l) (0 : ℤ) (Int.ofNat (List.length l))
  := sorry
end cursor_examples_TestListCursor_sum_of_listqtvc
