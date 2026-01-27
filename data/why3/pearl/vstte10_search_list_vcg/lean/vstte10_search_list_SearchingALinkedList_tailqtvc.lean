import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_search_list_SearchingALinkedList_tailqtvc
noncomputable def zero_at (l : List ℤ) (i : ℤ) := getElem_i? l i = Option.some (0 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬getElem_i? l j = Option.some (0 : ℤ))
noncomputable def no_zero (l : List ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length l) → ¬getElem_i? l j = Option.some (0 : ℤ)
theorem tail'vc {α : Type} [Inhabited α] (l : List α) (fact0 : ¬l = ([] : List α)) : (match l with | ([] : List α) => False | List.cons _ t => True) ∧ (∀(result : List α), (match l with | ([] : List α) => False | List.cons _ t => result = t) → List.tail? l = Option.some result)
  := sorry
end vstte10_search_list_SearchingALinkedList_tailqtvc
