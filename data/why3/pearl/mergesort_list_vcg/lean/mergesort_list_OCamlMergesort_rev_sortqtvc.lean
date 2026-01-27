import Why3.Base
open Classical
open Lean4Why3
namespace mergesort_list_OCamlMergesort_rev_sortqtvc
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
theorem rev_sort'vc (n : ℤ) (l : List elt) (fact0 : (2 : ℤ) ≤ n) (fact1 : n ≤ Int.ofNat (List.length l)) : (if n = (2 : ℤ) then match l with | List.cons x1 (List.cons x2 _) => True | _ => False else if n = (3 : ℤ) then match l with | List.cons x1 (List.cons x2 (List.cons x3 _)) => True | _ => False else ¬(2 : ℤ) = (0 : ℤ) ∧ (let n1 : ℤ := Int.tdiv n (2 : ℤ); let n2 : ℤ := n - n1; ((0 : ℤ) ≤ n1 ∧ n1 ≤ Int.ofNat (List.length l)) ∧ (∀(l2 : List elt), l = prefix1 n1 l ++ l2 → (((0 : ℤ) ≤ n ∧ n1 < n) ∧ (2 : ℤ) ≤ n1 ∧ n1 ≤ Int.ofNat (List.length l)) ∧ (∀(s1 : List elt), sorted s1 ∧ List.Perm s1 (prefix1 n1 l) → (((0 : ℤ) ≤ n ∧ n2 < n) ∧ (2 : ℤ) ≤ n2 ∧ n2 ≤ Int.ofNat (List.length l2)) ∧ (∀(s2 : List elt), sorted s2 ∧ List.Perm s2 (prefix1 n2 l2) → (let o1 : List elt := ([] : List elt); (sorted (List.reverse o1) ∧ sorted s1 ∧ sorted s2) ∧ (∀(x : elt) (y : elt), x ∈ o1 → y ∈ s1 → le x y) ∧ (∀(x : elt) (y : elt), x ∈ o1 → y ∈ s2 → le x y))))))) ∧ (∀(result : List elt), (if n = (2 : ℤ) then match l with | List.cons x1 (List.cons x2 _) => (if ¬le x1 x2 then result = List.cons x1 (List.cons x2 ([] : List elt)) else result = List.cons x2 (List.cons x1 ([] : List elt))) | _ => False else if n = (3 : ℤ) then match l with | List.cons x1 (List.cons x2 (List.cons x3 _)) => (if ¬le x1 x2 then if ¬le x2 x3 then result = List.cons x1 (List.cons x2 (List.cons x3 ([] : List elt))) else if ¬le x1 x3 then result = List.cons x1 (List.cons x3 (List.cons x2 ([] : List elt))) else result = List.cons x3 (List.cons x1 (List.cons x2 ([] : List elt))) else if ¬le x1 x3 then result = List.cons x2 (List.cons x1 (List.cons x3 ([] : List elt))) else if ¬le x2 x3 then result = List.cons x2 (List.cons x3 (List.cons x1 ([] : List elt))) else result = List.cons x3 (List.cons x2 (List.cons x1 ([] : List elt)))) | _ => False else let n1 : ℤ := Int.tdiv n (2 : ℤ); ∃(l2 : List elt), l = prefix1 n1 l ++ l2 ∧ (∃(s1 : List elt), (sorted s1 ∧ List.Perm s1 (prefix1 n1 l)) ∧ (∃(s2 : List elt), (sorted s2 ∧ List.Perm s2 (prefix1 (n - n1) l2)) ∧ sorted (List.reverse result) ∧ List.Perm result ((([] : List elt) ++ s1) ++ s2)))) → sorted (List.reverse result) ∧ List.Perm result (prefix1 n l))
  := sorry
end mergesort_list_OCamlMergesort_rev_sortqtvc
