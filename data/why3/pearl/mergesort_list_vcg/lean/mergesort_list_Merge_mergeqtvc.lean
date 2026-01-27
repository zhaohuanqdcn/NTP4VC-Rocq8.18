import Why3.Base
open Classical
open Lean4Why3
namespace mergesort_list_Merge_mergeqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
inductive sorted : List elt -> Prop where
 | Sorted_Nil : sorted ([] : List elt)
 | Sorted_One (x : elt) : sorted (List.cons x ([] : List elt))
 | Sorted_Two (x : elt) (y : elt) (l : List elt) : le x y → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List elt) (x : elt) : ((∀(y : elt), y ∈ l → le x y) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List elt) (l2 : List elt) : (sorted l1 ∧ sorted l2 ∧ (∀(x : elt) (y : elt), x ∈ l1 → y ∈ l2 → le x y)) = sorted (l1 ++ l2)
theorem merge'vc (l1 : List elt) (l2 : List elt) (fact0 : sorted l1) (fact1 : sorted l2) : (match l2 with | ([] : List elt) => (match l1 with | ([] : List elt) => True | _ => True) | List.cons x x1 => (match l1 with | ([] : List elt) => True | List.cons x2 x3 => (if le x2 x then ((0 : ℤ) ≤ Int.ofNat (List.length l1) + Int.ofNat (List.length l2) ∧ Int.ofNat (List.length x3) + Int.ofNat (List.length l2) < Int.ofNat (List.length l1) + Int.ofNat (List.length l2)) ∧ sorted x3 ∧ sorted l2 else ((0 : ℤ) ≤ Int.ofNat (List.length l1) + Int.ofNat (List.length l2) ∧ Int.ofNat (List.length l1) + Int.ofNat (List.length x1) < Int.ofNat (List.length l1) + Int.ofNat (List.length l2)) ∧ sorted l1 ∧ sorted x1))) ∧ (∀(result : List elt), (match l2 with | ([] : List elt) => (match l1 with | ([] : List elt) => result = l2 | _ => result = l1) | List.cons x x1 => (match l1 with | ([] : List elt) => result = l2 | List.cons x2 x3 => (if le x2 x then ∃(o1 : List elt), (sorted o1 ∧ List.Perm o1 (x3 ++ l2)) ∧ result = List.cons x2 o1 else ∃(o1 : List elt), (sorted o1 ∧ List.Perm o1 (l1 ++ x1)) ∧ result = List.cons x o1))) → sorted result ∧ List.Perm result (l1 ++ l2))
  := sorry
end mergesort_list_Merge_mergeqtvc
