import Why3.Base
open Classical
open Lean4Why3
namespace insertion_sort_list_InsertionSort_insertqtvc
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
theorem insert'vc (l : List elt) (x : elt) (fact0 : sorted l) : (match l with | ([] : List elt) => True | List.cons y r => ¬le x y → (match l with | ([] : List elt) => False | List.cons _ f => f = r) ∧ sorted r) ∧ (∀(result : List elt), (match l with | ([] : List elt) => result = List.cons x ([] : List elt) | List.cons y r => (if le x y then result = List.cons x l else ∃(o1 : List elt), (sorted o1 ∧ List.Perm (List.cons x r) o1) ∧ result = List.cons y o1)) → sorted result ∧ List.Perm (List.cons x l) result)
  := sorry
end insertion_sort_list_InsertionSort_insertqtvc
