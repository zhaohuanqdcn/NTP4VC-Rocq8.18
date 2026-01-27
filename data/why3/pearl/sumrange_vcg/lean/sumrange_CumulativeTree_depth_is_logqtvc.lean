import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_depth_is_logqtvc
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
theorem depth_is_log'vc (k : ℤ) (t : tree) (a : List ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t))) (fact2 : indexes.high (indexes1 t) - indexes.low (indexes1 t) ≤ HPow.hPow 2 (Int.toNat k)) : depth t ≤ k + (1 : ℤ)
  := sorry
end sumrange_CumulativeTree_depth_is_logqtvc
