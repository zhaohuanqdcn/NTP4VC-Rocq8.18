import Why3.Base
open Classical
open Lean4Why3
namespace there_and_back_again_Palindrome_palindromeqtvc
noncomputable def pal {α : Type} [Inhabited α] (x : List α) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → getElem_i? x i = getElem_i? x (n - (1 : ℤ) - i)
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom eq : elt -> elt -> Prop
axiom eq'spec (x : elt) (y : elt) : eq x y = (x = y)
theorem palindrome'vc (x : List elt) : List.length x ≤ List.length x ∧ (∀(o1 : List elt), (∃(x0 : List elt), List.length x0 = List.length x ∧ x = x0 ++ o1) ∧ pal x (Int.ofNat (List.length x)) → pal x (Int.ofNat (List.length x))) ∧ ((∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length x)) ∧ ¬getElem_i? x i = getElem_i? x (Int.ofNat (List.length x) - (1 : ℤ) - i)) → ¬pal x (Int.ofNat (List.length x)))
  := sorry
end there_and_back_again_Palindrome_palindromeqtvc
