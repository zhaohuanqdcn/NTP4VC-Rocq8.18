import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_search_list_SearchingALinkedList_searchqtvc
noncomputable def zero_at (l : List ℤ) (i : ℤ) := getElem_i? l i = Option.some (0 : ℤ) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬getElem_i? l j = Option.some (0 : ℤ))
noncomputable def no_zero (l : List ℤ) := ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < Int.ofNat (List.length l) → ¬getElem_i? l j = Option.some (0 : ℤ)
theorem search'vc (l : List ℤ) (i : ℤ) : (match l with | ([] : List ℤ) => True | List.cons x r => ¬x = (0 : ℤ) → (match l with | ([] : List ℤ) => False | List.cons _ f => f = r)) ∧ (∀(result : ℤ), (match l with | ([] : List ℤ) => result = i | List.cons x r => (if x = (0 : ℤ) then result = i else let o1 : ℤ := i + (1 : ℤ); (o1 ≤ result ∧ result < o1 + Int.ofNat (List.length r)) ∧ zero_at r (result - o1) ∨ result = o1 + Int.ofNat (List.length r) ∧ no_zero r)) → (i ≤ result ∧ result < i + Int.ofNat (List.length l)) ∧ zero_at l (result - i) ∨ result = i + Int.ofNat (List.length l) ∧ no_zero l)
  := sorry
end vstte10_search_list_SearchingALinkedList_searchqtvc
