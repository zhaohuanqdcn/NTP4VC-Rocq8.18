import Why3.Base
open Classical
open Lean4Why3
namespace sorted_list_FindInSortedList_sorted_not_memqtvc
theorem sorted_not_mem'vc (x : ℤ) (y : ℤ) (l : List ℤ) (fact0 : x < y) (fact1 : Sorted (List.cons y l)) : ¬x ∈ List.cons y l
  := sorry
end sorted_list_FindInSortedList_sorted_not_memqtvc
