import Why3.Base
open Classical
open Lean4Why3
namespace BinTree
inductive tree where
  | Null : tree
  | Tree : ℤ -> tree -> tree -> tree
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
noncomputable def mem : ℤ -> tree -> Prop
  | v, tree.Null => False
  | v, (tree.Tree x l r) => x = v ∨ mem v l ∨ mem v r
noncomputable def ge_tree : ℤ -> tree -> Prop
  | v, tree.Null => True
  | v, (tree.Tree x l r) => x ≤ v ∧ ge_tree v l ∧ ge_tree v r
end BinTree
