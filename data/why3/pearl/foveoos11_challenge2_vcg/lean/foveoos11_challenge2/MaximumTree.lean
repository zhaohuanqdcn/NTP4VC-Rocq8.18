import Why3.Base
open Classical
open Lean4Why3
namespace MaximumTree
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
end MaximumTree
