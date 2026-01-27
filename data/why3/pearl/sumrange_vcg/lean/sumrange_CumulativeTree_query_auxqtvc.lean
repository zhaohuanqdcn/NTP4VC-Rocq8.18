import Why3.Base
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_query_auxqtvc
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
theorem query_aux'vc (t : tree) (a : List ℤ) (i : ℤ) (j : ℤ) (fact0 : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t))) (fact1 : (0 : ℤ) ≤ indexes.low (indexes1 t)) (fact2 : indexes.low (indexes1 t) ≤ i) (fact3 : i < j) (fact4 : j ≤ indexes.high (indexes1 t)) (fact5 : indexes.high (indexes1 t) ≤ Int.ofNat (List.length a)) : (match t with | tree.Leaf ind => True | tree.Node ind l r => (∀(o1 : Bool), (if i = indexes.low ind then o1 = (if j = indexes.high ind then true else false) else o1 = false) → ¬o1 = true → (let m : ℤ := indexes.high (indexes1 l); if j ≤ m then (match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 l) ∧ indexes.low (indexes1 l) ≤ i ∧ i < j ∧ j ≤ indexes.high (indexes1 l) ∧ indexes.high (indexes1 l) ≤ Int.ofNat (List.length a) else if m ≤ i then (match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 r) ∧ indexes.low (indexes1 r) ≤ i ∧ i < j ∧ j ≤ indexes.high (indexes1 r) ∧ indexes.high (indexes1 r) ≤ Int.ofNat (List.length a) else ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 r) ∧ indexes.low (indexes1 r) ≤ m ∧ m < j ∧ j ≤ indexes.high (indexes1 r) ∧ indexes.high (indexes1 r) ≤ Int.ofNat (List.length a)) ∧ (match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 l) ∧ indexes.low (indexes1 l) ≤ i ∧ i < m ∧ m ≤ indexes.high (indexes1 l) ∧ indexes.high (indexes1 l) ≤ Int.ofNat (List.length a)))) ∧ (∀(result : ℤ), (match t with | tree.Leaf ind => result = indexes.isum ind | tree.Node ind l r => (∃(o1 : Bool), (if i = indexes.low ind then o1 = (if j = indexes.high ind then true else false) else o1 = false) ∧ (if o1 = true then result = indexes.isum ind else let m : ℤ := indexes.high (indexes1 l); if j ≤ m then result = ArraySum.sum a i j else if m ≤ i then result = ArraySum.sum a i j else result = ArraySum.sum a i m + ArraySum.sum a m j))) → result = ArraySum.sum a i j)
  := sorry
end sumrange_CumulativeTree_query_auxqtvc
