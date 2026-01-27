import Why3.Base
open Classical
open Lean4Why3
namespace mergesort_list_Mergesort_splitqtvc
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
theorem split'vc {α : Type} [Inhabited α] (l0 : List α) (fact0 : (2 : ℤ) ≤ Int.ofNat (List.length l0)) : (∀(l1 : List α) (l2 : List α) (l : List α), List.length l2 = List.length l1 ∨ Int.ofNat (List.length l2) = Int.ofNat (List.length l1) + (1 : ℤ) → (match l with | ([] : List α) => True | List.cons x r => (let o1 : List α := List.cons x l1; ((0 : ℤ) ≤ Int.ofNat (List.length l) ∧ List.length r < List.length l) ∧ (List.length o1 = List.length l2 ∨ Int.ofNat (List.length o1) = Int.ofNat (List.length l2) + (1 : ℤ)))) ∧ (∀(r1 : List α) (r2 : List α), (match l with | ([] : List α) => r1 = l1 ∧ r2 = l2 | List.cons x r => (List.length r2 = List.length r1 ∨ Int.ofNat (List.length r2) = Int.ofNat (List.length r1) + (1 : ℤ)) ∧ List.Perm (r1 ++ r2) (l2 ++ List.cons x l1 ++ r)) → (List.length r2 = List.length r1 ∨ Int.ofNat (List.length r2) = Int.ofNat (List.length r1) + (1 : ℤ)) ∧ List.Perm (r1 ++ r2) (l1 ++ l2 ++ l))) ∧ (let o1 : List α := ([] : List α); let o2 : List α := ([] : List α); (List.length o1 = List.length o2 ∨ Int.ofNat (List.length o1) = Int.ofNat (List.length o2) + (1 : ℤ)) ∧ (∀(l1 : List α) (l2 : List α), (List.length l2 = List.length l1 ∨ Int.ofNat (List.length l2) = Int.ofNat (List.length l1) + (1 : ℤ)) ∧ List.Perm (l1 ++ l2) (o2 ++ o1 ++ l0) → (1 : ℤ) ≤ Int.ofNat (List.length l1) ∧ (1 : ℤ) ≤ Int.ofNat (List.length l2) ∧ List.Perm l0 (l1 ++ l2)))
  := sorry
end mergesort_list_Mergesort_splitqtvc
