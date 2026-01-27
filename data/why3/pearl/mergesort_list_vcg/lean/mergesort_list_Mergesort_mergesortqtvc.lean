import Why3.Base
open Classical
open Lean4Why3
namespace mergesort_list_Mergesort_mergesortqtvc
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
theorem mergesort'vc (l : List elt) : (match l with | ([] : List elt) => True | List.cons _ ([] : List elt) => True | _ => (2 : ℤ) ≤ Int.ofNat (List.length l) ∧ (∀(l1 : List elt) (l2 : List elt), (1 : ℤ) ≤ Int.ofNat (List.length l1) ∧ (1 : ℤ) ≤ Int.ofNat (List.length l2) ∧ List.Perm l (l1 ++ l2) → ((0 : ℤ) ≤ Int.ofNat (List.length l) ∧ List.length l2 < List.length l) ∧ (∀(o1 : List elt), sorted o1 ∧ List.Perm o1 l2 → ((0 : ℤ) ≤ Int.ofNat (List.length l) ∧ List.length l1 < List.length l) ∧ (∀(o2 : List elt), sorted o2 ∧ List.Perm o2 l1 → sorted o2 ∧ sorted o1)))) ∧ (∀(result : List elt), (match l with | ([] : List elt) => result = l | List.cons _ ([] : List elt) => result = l | _ => (∃(l1 : List elt) (l2 : List elt), ((1 : ℤ) ≤ Int.ofNat (List.length l1) ∧ (1 : ℤ) ≤ Int.ofNat (List.length l2) ∧ List.Perm l (l1 ++ l2)) ∧ (∃(o1 : List elt), (sorted o1 ∧ List.Perm o1 l2) ∧ (∃(o2 : List elt), (sorted o2 ∧ List.Perm o2 l1) ∧ sorted result ∧ List.Perm result (o2 ++ o1))))) → sorted result ∧ List.Perm result l)
  := sorry
end mergesort_list_Mergesort_mergesortqtvc
