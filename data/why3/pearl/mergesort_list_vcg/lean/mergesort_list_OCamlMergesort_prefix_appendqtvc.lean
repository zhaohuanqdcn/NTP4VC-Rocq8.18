import Why3.Base
open Classical
open Lean4Why3
namespace mergesort_list_OCamlMergesort_prefix_appendqtvc
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
axiom prefix1 :  {α : Type} -> [Inhabited α] -> ℤ -> List α -> List α
axiom prefix_def1 {α : Type} [Inhabited α] (l : List α) : prefix1 (0 : ℤ) l = ([] : List α)
axiom prefix_def2 {α : Type} [Inhabited α] (n : ℤ) (x : α) (l : List α) (fact0 : (0 : ℤ) < n) : prefix1 n (List.cons x l) = List.cons x (prefix1 (n - (1 : ℤ)) l)
theorem prefix_append'vc {α : Type} [Inhabited α] (l1 : List α) (n : ℤ) (l2 : List α) (fact0 : Int.ofNat (List.length l1) ≤ n) (fact1 : n ≤ Int.ofNat (List.length l1) + Int.ofNat (List.length l2)) : prefix1 n (l1 ++ l2) = prefix1 (Int.ofNat (List.length l1)) l1 ++ prefix1 (n - Int.ofNat (List.length l1)) l2
  := sorry
end mergesort_list_OCamlMergesort_prefix_appendqtvc
