import Why3.Base
open Classical
open Lean4Why3
namespace coincidence_count_list_CoincidenceCountList_coincidence_countqtvc
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (x : ℤ) (y : ℤ) (l : List ℤ) : x < y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → x < y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → x < y)) = sorted (l1 ++ l2)
theorem coincidence_count'vc (a : List ℤ) (b : List ℤ) (fact0 : sorted a) (fact1 : sorted b) : (match b with | List.cons x x1 => (match a with | List.cons x2 x3 => (if x2 = x then ((match a with | ([] : List ℤ) => False | List.cons _ f => f = x3) ∨ a = x3 ∧ (match b with | ([] : List ℤ) => False | List.cons _ f => f = x1)) ∧ sorted x3 ∧ sorted x1 else if x2 < x then (match a with | ([] : List ℤ) => False | List.cons _ f => f = x3) ∧ sorted x3 ∧ sorted b else (match b with | ([] : List ℤ) => False | List.cons _ f => f = x1) ∧ sorted a ∧ sorted x1) | _ => True) | _ => True) ∧ (∀(result : List ℤ), (match b with | List.cons x x1 => (match a with | List.cons x2 x3 => (if x2 = x then ∃(o1 : List ℤ), (∀(x4 : ℤ), (x4 ∈ o1) = (x4 ∈ x3 ∧ x4 ∈ x1)) ∧ result = List.cons x2 o1 else if x2 < x then ∀(x4 : ℤ), (x4 ∈ result) = (x4 ∈ x3 ∧ x4 ∈ b) else ∀(x4 : ℤ), (x4 ∈ result) = (x4 ∈ a ∧ x4 ∈ x1)) | _ => result = ([] : List ℤ)) | _ => result = ([] : List ℤ)) → (∀(x : ℤ), (x ∈ result) = (x ∈ a ∧ x ∈ b)))
  := sorry
end coincidence_count_list_CoincidenceCountList_coincidence_countqtvc
