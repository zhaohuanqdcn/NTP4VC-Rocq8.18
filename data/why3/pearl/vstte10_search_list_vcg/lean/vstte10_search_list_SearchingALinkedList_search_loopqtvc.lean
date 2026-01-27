import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace vstte10_search_list_SearchingALinkedList_search_loopqtvc
noncomputable def zero_at (l : List ℤ) (i : ℤ) := getElem_i? l i = Option.some (0 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬getElem_i? l j = Option.some (0 : ℤ))
noncomputable def no_zero (l : List ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length l) → ¬getElem_i? l j = Option.some (0 : ℤ)
theorem search_loop'vc (l : List ℤ) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + Int.ofNat (List.length l) = Int.ofNat (List.length l) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → getElem_i? l j = getElem_i? l ((0 : ℤ) + j)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬getElem_i? l j = Option.some (0 : ℤ)) ∧ (∀(s : List ℤ) (i : ℤ), (0 : ℤ) ≤ i ∧ i + Int.ofNat (List.length s) = Int.ofNat (List.length l) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → getElem_i? s j = getElem_i? l (i + j)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬getElem_i? l j = Option.some (0 : ℤ)) → is_nil s = (s = ([] : List ℤ)) → (¬is_nil s → ¬s = ([] : List ℤ)) ∧ (∀(o1 : Bool), (if ¬is_nil s then ∃(o2 : ℤ), List.head? s = Option.some o2 ∧ o1 = (if o2 = (0 : ℤ) then false else true) else o1 = false) → (if o1 = true then ¬s = ([] : List ℤ) ∧ (∀(o2 : List ℤ), List.tail? s = Option.some o2 → (match s with | ([] : List ℤ) => False | List.cons _ f => f = o2) ∧ (0 : ℤ) ≤ i + (1 : ℤ) ∧ i + (1 : ℤ) + Int.ofNat (List.length o2) = Int.ofNat (List.length l) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → getElem_i? o2 j = getElem_i? l (i + (1 : ℤ) + j)) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i + (1 : ℤ) → ¬getElem_i? l j = Option.some (0 : ℤ))) else ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length l)) ∧ zero_at l i ∨ i = Int.ofNat (List.length l) ∧ no_zero l)))
  := sorry
end vstte10_search_list_SearchingALinkedList_search_loopqtvc
