import Why3.Base
open Classical
open Lean4Why3
namespace sorted_list_FindInSortedList_findqtvc
theorem find'vc (l : List ℤ) (x : ℤ) (fact0 : Sorted l) : (match l with | ([] : List ℤ) => True | List.cons y r => ¬x = y → y < x → (match l with | ([] : List ℤ) => False | List.cons _ f => f = r) ∧ Sorted r) ∧ (∀(result : Bool), (match l with | ([] : List ℤ) => result = false | List.cons y r => (if x = y then result = true else if y < x then result = (if x ∈ r then true else false) else result = false)) → (result = true) = (x ∈ l))
  := sorry
end sorted_list_FindInSortedList_findqtvc
