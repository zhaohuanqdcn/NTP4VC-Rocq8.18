import Why3.Base
open Classical
open Lean4Why3
namespace foveoos11_challenge2_MaximumTree_maximumqtvc
inductive tree where
  | Empty : tree
  | Node : tree -> ℤ -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def size : tree -> ℤ
  | tree.Empty => (0 : ℤ)
  | (tree.Node l x r) => (1 : ℤ) + size l + size r
noncomputable def mem : ℤ -> tree -> Prop
  | x, tree.Empty => False
  | x, (tree.Node l v r) => mem x l ∨ x = v ∨ mem x r
theorem maximum'vc (t : tree) (fact0 : ¬t = tree.Empty) : (match t with | tree.Empty => False | tree.Node tree.Empty v tree.Empty => True | tree.Node tree.Empty v s => ((0 : ℤ) ≤ size t ∧ size s < size t) ∧ ¬s = tree.Empty | tree.Node s v tree.Empty => ((0 : ℤ) ≤ size t ∧ size s < size t) ∧ ¬s = tree.Empty | tree.Node l v r => (((0 : ℤ) ≤ size t ∧ size r < size t) ∧ ¬r = tree.Empty) ∧ (∀(o1 : ℤ), mem o1 r ∧ (∀(x : ℤ), mem x r → x ≤ o1) → ((0 : ℤ) ≤ size t ∧ size l < size t) ∧ ¬l = tree.Empty)) ∧ (∀(result : ℤ), (match t with | tree.Empty => False | tree.Node tree.Empty v tree.Empty => result = v | tree.Node tree.Empty v s => (∃(o1 : ℤ), (mem o1 s ∧ (∀(x : ℤ), mem x s → x ≤ o1)) ∧ result = max o1 v) | tree.Node s v tree.Empty => (∃(o1 : ℤ), (mem o1 s ∧ (∀(x : ℤ), mem x s → x ≤ o1)) ∧ result = max o1 v) | tree.Node l v r => (∃(o1 : ℤ), (mem o1 r ∧ (∀(x : ℤ), mem x r → x ≤ o1)) ∧ (∃(o2 : ℤ), (mem o2 l ∧ (∀(x : ℤ), mem x l → x ≤ o2)) ∧ result = max o2 (max v o1)))) → mem result t ∧ (∀(x : ℤ), mem x t → x ≤ result))
  := sorry
end foveoos11_challenge2_MaximumTree_maximumqtvc
