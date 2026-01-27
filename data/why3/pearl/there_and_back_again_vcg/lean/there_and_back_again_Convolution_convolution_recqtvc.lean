import Why3.Base
open Classical
open Lean4Why3
namespace there_and_back_again_Convolution_convolution_recqtvc
theorem convolution_rec'vc {α : Type} [Inhabited α] (x : List α) (y : List α) (fact0 : List.length x ≤ List.length y) : (match x with | ([] : List α) => True | List.cons x0 xs => ((match x with | ([] : List α) => False | List.cons _ f => f = xs) ∧ List.length xs ≤ List.length y) ∧ (∀(o1 : List (α × α)) (o2 : List α), (∃(y0 : List α), y = y0 ++ o2 ∧ List.length y0 = List.length xs ∧ o1 = List.zip xs (List.reverse y0)) → (match o2 with | List.cons x1 x2 => True | _ => False))) ∧ (∀(r : List (α × α)) (ys : List α), (match x with | ([] : List α) => r = ([] : List (α × α)) ∧ ys = y | List.cons x0 xs => (∃(r1 : List (α × α)) (ys1 : List α), (∃(y0 : List α), y = y0 ++ ys1 ∧ List.length y0 = List.length xs ∧ r1 = List.zip xs (List.reverse y0)) ∧ (match ys1 with | List.cons x1 x2 => r = List.cons (x0, x1) r1 ∧ ys = x2 | _ => False))) → (∃(y0 : List α), y = y0 ++ ys ∧ List.length y0 = List.length x ∧ r = List.zip x (List.reverse y0)))
  := sorry
end there_and_back_again_Convolution_convolution_recqtvc
