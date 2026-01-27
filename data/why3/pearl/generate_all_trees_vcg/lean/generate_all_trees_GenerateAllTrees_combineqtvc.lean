import Why3.Base
open Classical
open Lean4Why3
namespace generate_all_trees_GenerateAllTrees_combineqtvc
inductive tree where
  | Empty : tree
  | Node : tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l r) => (1 : ℤ) + size l + size r
noncomputable def all_trees (n : ℤ) (l : List tree) := List.Nodup l ∧ (∀(t : tree), (size t = n) = (t ∈ l))
theorem combine'vc (i1 : ℤ) (l1 : List tree) (i2 : ℤ) (l2 : List tree) (fact0 : (0 : ℤ) ≤ i1) (fact1 : all_trees i1 l1) (fact2 : (0 : ℤ) ≤ i2) (fact3 : all_trees i2 l2) : (∀(l11 : List tree), List.Nodup l11 → (match l11 with | ([] : List tree) => True | List.cons t1 l12 => (∀(l21 : List tree), List.Nodup l21 → (match l21 with | ([] : List tree) => True | List.cons t2 l22 => (match l21 with | ([] : List tree) => False | List.cons _ f => f = l22) ∧ List.Nodup l22) ∧ (∀(result : List tree), (match l21 with | ([] : List tree) => result = ([] : List tree) | List.cons t2 l22 => (∃(o1 : List tree), (List.Nodup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(r : tree), t = tree.Node t1 r ∧ r ∈ l22))) ∧ result = List.cons (tree.Node t1 t2) o1)) → List.Nodup result ∧ (∀(t : tree), (t ∈ result) = (∃(r : tree), t = tree.Node t1 r ∧ r ∈ l21)))) ∧ ((match l11 with | ([] : List tree) => False | List.cons _ f => f = l12) ∧ List.Nodup l12) ∧ (∀(o1 : List tree), List.Nodup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(l : tree) (r : tree), t = tree.Node l r ∧ l ∈ l12 ∧ r ∈ l2)) → List.Nodup l2)) ∧ (∀(result : List tree), (match l11 with | ([] : List tree) => result = ([] : List tree) | List.cons t1 l12 => (∃(o1 : List tree), (List.Nodup o1 ∧ (∀(t : tree), (t ∈ o1) = (∃(l : tree) (r : tree), t = tree.Node l r ∧ l ∈ l12 ∧ r ∈ l2))) ∧ (∃(o2 : List tree), (List.Nodup o2 ∧ (∀(t : tree), (t ∈ o2) = (∃(r : tree), t = tree.Node t1 r ∧ r ∈ l2))) ∧ result = o2 ++ o1))) → List.Nodup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = tree.Node l r ∧ l ∈ l11 ∧ r ∈ l2)))) ∧ List.Nodup l1 ∧ (∀(result : List tree), List.Nodup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = tree.Node l r ∧ l ∈ l1 ∧ r ∈ l2)) → List.Nodup result ∧ (∀(t : tree), (t ∈ result) = (∃(l : tree) (r : tree), t = tree.Node l r ∧ size l = i1 ∧ size r = i2)))
  := sorry
end generate_all_trees_GenerateAllTrees_combineqtvc
