import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_updateqtvc
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
theorem update'vc (i : ℤ) (a : List ℤ) (t : tree) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < Int.ofNat (List.length a)) (fact2 : is_tree_for t a (0 : ℤ) (Int.ofNat (List.length a))) : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t)) ∧ indexes.low (indexes1 t) ≤ i ∧ i < indexes.high (indexes1 t) ∧ (∀(t1 : tree), indexes.low (indexes1 t1) = indexes.low (indexes1 t) ∧ indexes.high (indexes1 t1) = indexes.high (indexes1 t) ∧ is_tree_for t1 (List.set a (Int.toNat i) v) (indexes.low (indexes1 t1)) (indexes.high (indexes1 t1)) → ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length a)) ∧ (List.length (List.set a (Int.toNat i) v) = List.length a → getElem! (List.set a (Int.toNat i) v) ∘ Int.toNat = Function.update (getElem! a ∘ Int.toNat) i v → (List.set a (Int.toNat i) v)[Int.toNat i]! = v ∧ (∀(k : ℤ), ((0 : ℤ) ≤ k ∧ k < Int.ofNat (List.length (List.set a (Int.toNat i) v))) ∧ ¬k = i → (List.set a (Int.toNat i) v)[Int.toNat k]! = a[Int.toNat k]!) ∧ is_tree_for t1 (List.set a (Int.toNat i) v) (0 : ℤ) (Int.ofNat (List.length (List.set a (Int.toNat i) v)))))
  := sorry
end sumrange_CumulativeTree_updateqtvc
