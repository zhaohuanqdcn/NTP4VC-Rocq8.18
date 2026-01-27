import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_tree_of_arrayqtvc
structure indexes where
  low : ℤ
  high : ℤ
  isum : ℤ
axiom inhabited_axiom_indexes : Inhabited indexes
attribute [instance] inhabited_axiom_indexes
inductive tree where
  | Leaf : indexes -> tree
  | Node : indexes -> tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def indexes1 (t : tree) := match t with | tree.Leaf ind => ind | tree.Node ind _ _ => ind
noncomputable def is_indexes_for (ind : indexes) (a : List ℤ) (i : ℤ) (j : ℤ) := indexes.low ind = i ∧ indexes.high ind = j ∧ ((0 : ℤ) ≤ i ∧ i < j ∧ j ≤ Int.ofNat (List.length a)) ∧ indexes.isum ind = ArraySum.sum a i j
noncomputable def is_tree_for : tree -> List ℤ -> ℤ -> ℤ -> Prop
  | (tree.Leaf ind), a, i, j => is_indexes_for ind a i j ∧ j = i + (1 : ℤ)
  | (tree.Node ind l r), a, i, j => is_indexes_for ind a i j ∧ i = indexes.low (indexes1 l) ∧ j = indexes.high (indexes1 r) ∧ (let m : ℤ := indexes.high (indexes1 l); m = indexes.low (indexes1 r) ∧ (i < m ∧ m < j) ∧ m = Int.tdiv (i + j) (2 : ℤ) ∧ is_tree_for l a i m ∧ is_tree_for r a m j)
theorem tree_of_array'vc (i : ℤ) (j : ℤ) (a : List ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < j) (fact2 : j ≤ Int.ofNat (List.length a)) : let o1 : ℤ := i + (1 : ℤ); (if o1 = j then (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a) else ¬(2 : ℤ) = (0 : ℤ) ∧ (let m : ℤ := Int.tdiv (i + j) (2 : ℤ); (((0 : ℤ) ≤ j - i ∧ m - i < j - i) ∧ (0 : ℤ) ≤ i ∧ i < m ∧ m ≤ Int.ofNat (List.length a)) ∧ (∀(l : tree), is_tree_for l a i m → ((0 : ℤ) ≤ j - i ∧ j - m < j - i) ∧ (0 : ℤ) ≤ m ∧ m < j ∧ j ≤ Int.ofNat (List.length a)))) ∧ (∀(result : tree), (if o1 = j then result = tree.Leaf (indexes.mk i j (a[Int.toNat i]!)) else let m : ℤ := Int.tdiv (i + j) (2 : ℤ); ∃(l : tree), is_tree_for l a i m ∧ (∃(r : tree), is_tree_for r a m j ∧ result = tree.Node (indexes.mk i j (indexes.isum (indexes1 l) + indexes.isum (indexes1 r))) l r)) → is_tree_for result a i j)
  := sorry
end sumrange_CumulativeTree_tree_of_arrayqtvc
