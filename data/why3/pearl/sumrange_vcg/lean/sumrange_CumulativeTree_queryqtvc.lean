import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_queryqtvc
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
theorem query'vc (i : ℤ) (j : ℤ) (a : List ℤ) (t : tree) (fact0 : (0 : ℤ) ≤ i) (fact1 : i ≤ j) (fact2 : j ≤ Int.ofNat (List.length a)) (fact3 : is_tree_for t a (0 : ℤ) (Int.ofNat (List.length a))) : (¬i = j → is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 t) ∧ indexes.low (indexes1 t) ≤ i ∧ i < j ∧ j ≤ indexes.high (indexes1 t) ∧ indexes.high (indexes1 t) ≤ Int.ofNat (List.length a)) ∧ (∀(result : ℤ), (if i = j then result = (0 : ℤ) else result = ArraySum.sum a i j) → result = ArraySum.sum a i j)
  := sorry
end sumrange_CumulativeTree_queryqtvc
