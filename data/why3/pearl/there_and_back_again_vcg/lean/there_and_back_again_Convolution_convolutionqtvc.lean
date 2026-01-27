import Why3.Base
open Classical
open Lean4Why3
namespace there_and_back_again_Convolution_convolutionqtvc
theorem convolution'vc {α : Type} [Inhabited α] (x : List α) (y : List α) (fact0 : List.length x = List.length y) : List.length x ≤ List.length y ∧ (∀(o1 : List (α × α)) (o2 : List α), (∃(y0 : List α), y = y0 ++ o2 ∧ List.length y0 = List.length x ∧ o1 = List.zip x (List.reverse y0)) → o1 = List.zip x (List.reverse y))
  := sorry
end there_and_back_again_Convolution_convolutionqtvc
