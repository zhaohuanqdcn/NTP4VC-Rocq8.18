import Why3.Base
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_ghc_sort_Top_Trans1
axiom Trans (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x < y) (fact1 : y < z) : x < z
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted (l1 ++ l2)
theorem Trans1 (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : x ≤ y) (fact1 : y ≤ z) : x ≤ z
  := sorry
end verifythis_2019_ghc_sort_Top_Trans1
