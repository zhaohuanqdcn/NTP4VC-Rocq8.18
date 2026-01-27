import Why3.Base
open Classical
open Lean4Why3
namespace there_and_back_again_Palindrome_palindrome_recqtvc
noncomputable def pal {α : Type} [Inhabited α] (x : List α) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → getElem_i? x i = getElem_i? x (n - (1 : ℤ) - i)
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom eq : elt -> elt -> Prop
axiom eq'spec (x : elt) (y : elt) : eq x y = (x = y)
theorem palindrome_rec'vc (y : List elt) (x : List elt) (fact0 : List.length y ≤ List.length x) : match y with | ([] : List elt) => (∃(x0 : List elt), List.length x0 = List.length y ∧ x = x0 ++ x) ∧ pal x (Int.ofNat (List.length y)) | List.cons x1 x2 => (match x2 with | ([] : List elt) => (match x with | List.cons x3 x4 => (∃(x0 : List elt), List.length x0 = List.length y ∧ x = x0 ++ x4) ∧ pal x (Int.ofNat (List.length y)) | _ => False) | List.cons x3 x4 => (match x with | List.cons x5 x6 => ((match x with | ([] : List elt) => False | List.cons _ f => f = x6) ∧ List.length x4 ≤ List.length x6) ∧ (∀(o1 : List elt), (∃(x0 : List elt), List.length x0 = List.length x4 ∧ x6 = x0 ++ o1) ∧ pal x6 (Int.ofNat (List.length x4)) → (match o1 with | List.cons x11 xs => eq x5 x11 = (x5 = x11) → (if eq x5 x11 then (∃(x0 : List elt), List.length x0 = List.length y ∧ x = x0 ++ xs) ∧ pal x (Int.ofNat (List.length y)) else ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length y)) ∧ ¬getElem_i? x i = getElem_i? x (Int.ofNat (List.length y) - (1 : ℤ) - i)) | ([] : List elt) => False)) ∧ ((∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length x4)) ∧ ¬getElem_i? x6 i = getElem_i? x6 (Int.ofNat (List.length x4) - (1 : ℤ) - i)) → (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length y)) ∧ ¬getElem_i? x i = getElem_i? x (Int.ofNat (List.length y) - (1 : ℤ) - i))) | _ => False))
  := sorry
end there_and_back_again_Palindrome_palindrome_recqtvc
