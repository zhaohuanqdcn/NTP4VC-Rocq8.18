import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_search_list_SearchingALinkedList_search_listqtvc
noncomputable def zero_at (l : List ℤ) (i : ℤ) := getElem_i? l i = Option.some (0 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬getElem_i? l j = Option.some (0 : ℤ))
noncomputable def no_zero (l : List ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length l) → ¬getElem_i? l j = Option.some (0 : ℤ)
theorem search_list'vc (result : ℤ) (l : List ℤ) (fact0 : ((0 : ℤ) ≤ result ∧ result < (0 : ℤ) + Int.ofNat (List.length l)) ∧ zero_at l (result - (0 : ℤ)) ∨ result = (0 : ℤ) + Int.ofNat (List.length l) ∧ no_zero l) : ((0 : ℤ) ≤ result ∧ result < Int.ofNat (List.length l)) ∧ zero_at l result ∨ result = Int.ofNat (List.length l) ∧ no_zero l
  := sorry
end vstte10_search_list_SearchingALinkedList_search_listqtvc
