import Why3.Base
import Why3.why3.Ref.Ref
import pearl.sumrange_vcg.lean.sumrange.ArraySum
import pearl.sumrange_vcg.lean.sumrange.ExtraLemmas
open Classical
open Lean4Why3
namespace sumrange_CumulativeTree_query_aux_complexityqtvc
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
theorem query_aux_complexity'vc (t : tree) (a : List ℤ) (i : ℤ) (j : ℤ) (c : ℤ) (fact0 : is_tree_for t a (indexes.low (indexes1 t)) (indexes.high (indexes1 t))) (fact1 : (0 : ℤ) ≤ indexes.low (indexes1 t)) (fact2 : indexes.low (indexes1 t) ≤ i) (fact3 : i < j) (fact4 : j ≤ indexes.high (indexes1 t)) (fact5 : indexes.high (indexes1 t) ≤ Int.ofNat (List.length a)) : match t with | tree.Leaf ind => c + (1 : ℤ) - c ≤ (if i = indexes.low (indexes1 t) ∧ j = indexes.high (indexes1 t) then (1 : ℤ) else if i = indexes.low (indexes1 t) ∨ j = indexes.high (indexes1 t) then (2 : ℤ) * depth t else (4 : ℤ) * depth t) ∧ indexes.isum ind = ArraySum.sum a i j | tree.Node ind l r => (∀(o1 : Bool), (if i = indexes.low ind then o1 = (if j = indexes.high ind then true else false) else o1 = false) → (if o1 = true then c + (1 : ℤ) - c ≤ (if i = indexes.low (indexes1 t) ∧ j = indexes.high (indexes1 t) then (1 : ℤ) else if i = indexes.low (indexes1 t) ∨ j = indexes.high (indexes1 t) then (2 : ℤ) * depth t else (4 : ℤ) * depth t) ∧ indexes.isum ind = ArraySum.sum a i j else let m : ℤ := indexes.high (indexes1 l); if j ≤ m then ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 l) ∧ indexes.low (indexes1 l) ≤ i ∧ i < j ∧ j ≤ indexes.high (indexes1 l) ∧ indexes.high (indexes1 l) ≤ Int.ofNat (List.length a)) ∧ (∀(c1 : ℤ), c1 - (c + (1 : ℤ)) ≤ (if i = indexes.low (indexes1 l) ∧ j = indexes.high (indexes1 l) then (1 : ℤ) else if i = indexes.low (indexes1 l) ∨ j = indexes.high (indexes1 l) then (2 : ℤ) * depth l else (4 : ℤ) * depth l) → c1 - c ≤ (if i = indexes.low (indexes1 t) ∧ j = indexes.high (indexes1 t) then (1 : ℤ) else if i = indexes.low (indexes1 t) ∨ j = indexes.high (indexes1 t) then (2 : ℤ) * depth t else (4 : ℤ) * depth t)) else if m ≤ i then ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 r) ∧ indexes.low (indexes1 r) ≤ i ∧ i < j ∧ j ≤ indexes.high (indexes1 r) ∧ indexes.high (indexes1 r) ≤ Int.ofNat (List.length a)) ∧ (∀(c1 : ℤ), c1 - (c + (1 : ℤ)) ≤ (if i = indexes.low (indexes1 r) ∧ j = indexes.high (indexes1 r) then (1 : ℤ) else if i = indexes.low (indexes1 r) ∨ j = indexes.high (indexes1 r) then (2 : ℤ) * depth r else (4 : ℤ) * depth r) → c1 - c ≤ (if i = indexes.low (indexes1 t) ∧ j = indexes.high (indexes1 t) then (1 : ℤ) else if i = indexes.low (indexes1 t) ∨ j = indexes.high (indexes1 t) then (2 : ℤ) * depth t else (4 : ℤ) * depth t)) else ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = r ∨ f1 = r) ∧ is_tree_for r a (indexes.low (indexes1 r)) (indexes.high (indexes1 r)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 r) ∧ indexes.low (indexes1 r) ≤ m ∧ m < j ∧ j ≤ indexes.high (indexes1 r) ∧ indexes.high (indexes1 r) ≤ Int.ofNat (List.length a)) ∧ (∀(c1 : ℤ), c1 - (c + (1 : ℤ)) ≤ (if m = indexes.low (indexes1 r) ∧ j = indexes.high (indexes1 r) then (1 : ℤ) else if m = indexes.low (indexes1 r) ∨ j = indexes.high (indexes1 r) then (2 : ℤ) * depth r else (4 : ℤ) * depth r) → ((match t with | tree.Leaf _ => False | tree.Node _ f f1 => f = l ∨ f1 = l) ∧ is_tree_for l a (indexes.low (indexes1 l)) (indexes.high (indexes1 l)) ∧ (0 : ℤ) ≤ indexes.low (indexes1 l) ∧ indexes.low (indexes1 l) ≤ i ∧ i < m ∧ m ≤ indexes.high (indexes1 l) ∧ indexes.high (indexes1 l) ≤ Int.ofNat (List.length a)) ∧ (∀(c2 : ℤ), c2 - c1 ≤ (if i = indexes.low (indexes1 l) ∧ m = indexes.high (indexes1 l) then (1 : ℤ) else if i = indexes.low (indexes1 l) ∨ m = indexes.high (indexes1 l) then (2 : ℤ) * depth l else (4 : ℤ) * depth l) → c2 - c ≤ (if i = indexes.low (indexes1 t) ∧ j = indexes.high (indexes1 t) then (1 : ℤ) else if i = indexes.low (indexes1 t) ∨ j = indexes.high (indexes1 t) then (2 : ℤ) * depth t else (4 : ℤ) * depth t) ∧ ArraySum.sum a i m + ArraySum.sum a m j = ArraySum.sum a i j))))
  := sorry
end sumrange_CumulativeTree_query_aux_complexityqtvc
