import Why3.Base
import Why3.why3.Ref.Ref
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_update_aux_complexityqtvc
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
noncomputable def depth : tree -> ℤ
  | (tree.Leaf x) => (1 : ℤ)
  | (tree.Node x l r) => (1 : ℤ) + max (depth l) (depth r)
theorem update_aux_complexity'vc (t : tree) (a : List ℤ) (i : ℤ) (v : ℤ) (c : ℤ) (fact0 : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t))) (fact1 : indexes.low (indexes1 t) ≤ i) (fact2 : i < indexes.high (indexes1 t)) : match t with | tree.Leaf ind => (let o1 : tree := tree.Leaf (indexes.mk (indexes.low ind) (indexes.high ind) v); c + (1 : ℤ) - c ≤ depth t ∧ v - indexes.isum ind = v - a[Int.toNat i]! ∧ indexes.low (indexes1 o1) = indexes.low (indexes1 t) ∧ indexes.high (indexes1 o1) = indexes.high (indexes1 t) ∧ is_tree_for o1 (List.set a (Int.toNat i) v) (indexes.low (indexes1 o1)) (indexes.high (indexes1 o1))) | tree.Node ind l r => (if i < indexes.high (indexes1 l) then ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ indexes.low (indexes1 l) ≤ i ∧ i < indexes.high (indexes1 l)) ∧ (∀(c1 : ℤ) (l' : tree), c1 - (c + (1 : ℤ)) ≤ depth l ∧ indexes.low (indexes1 l') = indexes.low (indexes1 l) ∧ indexes.high (indexes1 l') = indexes.high (indexes1 l) ∧ is_tree_for l' (List.set a (Int.toNat i) v) (indexes.low (indexes1 l')) (indexes.high (indexes1 l')) → c1 - c ≤ depth t ∧ indexes.low (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l' r)) = indexes.low (indexes1 t) ∧ indexes.high (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l' r)) = indexes.high (indexes1 t) ∧ is_tree_for (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l' r) (List.set a (Int.toNat i) v) (indexes.low (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l' r))) (indexes.high (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l' r)))) else ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ indexes.low (indexes1 r) ≤ i ∧ i < indexes.high (indexes1 r)) ∧ (∀(c1 : ℤ) (r' : tree), c1 - (c + (1 : ℤ)) ≤ depth r ∧ indexes.low (indexes1 r') = indexes.low (indexes1 r) ∧ indexes.high (indexes1 r') = indexes.high (indexes1 r) ∧ is_tree_for r' (List.set a (Int.toNat i) v) (indexes.low (indexes1 r')) (indexes.high (indexes1 r')) → c1 - c ≤ depth t ∧ indexes.low (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l r')) = indexes.low (indexes1 t) ∧ indexes.high (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l r')) = indexes.high (indexes1 t) ∧ is_tree_for (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l r') (List.set a (Int.toNat i) v) (indexes.low (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l r'))) (indexes.high (indexes1 (tree.Node (indexes.mk (indexes.low ind) (indexes.high ind) (indexes.isum ind + (v - a[Int.toNat i]!))) l r')))))
  := sorry
end sumrange_CumulativeTree_update_aux_complexityqtvc
