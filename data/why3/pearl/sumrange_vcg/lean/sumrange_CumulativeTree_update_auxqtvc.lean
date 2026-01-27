import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_update_auxqtvc
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
theorem update_aux'vc (t : tree) (a : List ℤ) (i : ℤ) (v : ℤ) (fact0 : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t))) (fact1 : indexes.low (indexes1 t) ≤ i) (fact2 : i < indexes.high (indexes1 t)) : (match t with | tree.Leaf ind => True | tree.Node ind l r => (if i < indexes.high (indexes1 l) then (match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ indexes.low (indexes1 l) ≤ i ∧ i < indexes.high (indexes1 l) else (match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ indexes.low (indexes1 r) ≤ i ∧ i < indexes.high (indexes1 r))) ∧ (∀(t' : tree) (delta : ℤ), (match t with | tree.Leaf ind => t' = tree.Leaf (indexes.mk (indexes.low ind) (indexes.high ind) v) ∧ delta = v - indexes.isum ind | tree.Node ind l r => (if i < indexes.high (indexes1 l) then ∃(t'1 : tree), (indexes.low (indexes1 t'1) = indexes.low (indexes1 l) ∧ indexes.high (indexes1 t'1) = indexes.high (indexes1 l) ∧ is_tree_for t'1 (List.set a (Int.toNat i) v) (indexes.low (indexes1 t'1)) (indexes.high (indexes1 t'1))) ∧ t' = tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) t'1 r ∧ delta = v - a[Int.toNat i]! else ∃(t'1 : tree), (indexes.low (indexes1 t'1) = indexes.low (indexes1 r) ∧ indexes.high (indexes1 t'1) = indexes.high (indexes1 r) ∧ is_tree_for t'1 (List.set a (Int.toNat i) v) (indexes.low (indexes1 t'1)) (indexes.high (indexes1 t'1))) ∧ t' = tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l t'1 ∧ delta = v - a[Int.toNat i]!)) → delta = v - a[Int.toNat i]! ∧ indexes.low (indexes1 t') = indexes.low (indexes1 t) ∧ indexes.high (indexes1 t') = indexes.high (indexes1 t) ∧ is_tree_for t' (List.set a (Int.toNat i) v) (indexes.low (indexes1 t')) (indexes.high (indexes1 t')))
  := sorry
end sumrange_CumulativeTree_update_auxqtvc
