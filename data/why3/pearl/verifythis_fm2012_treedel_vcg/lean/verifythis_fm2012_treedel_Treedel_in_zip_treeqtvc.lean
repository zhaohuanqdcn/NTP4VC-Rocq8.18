import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_treedel_vcg.lean.verifythis_fm2012_treedel.Memory
import Why3.bintree.Tree
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Treedel_in_zip_treeqtvc
noncomputable def root (t : Tree.tree Memory.loc) := match t with | (Tree.tree.Empty : Tree.tree Memory.loc) => Memory.null | Tree.tree.Node _ p _ => p
noncomputable def istree : (Memory.loc -> Memory.node) -> Tree.tree Memory.loc -> Prop
  | m, (Tree.tree.Empty : Tree.tree Memory.loc) => True
  | m, (Tree.tree.Node l p r) => ¬p = Memory.null ∧ istree m l ∧ istree m r ∧ root l = Memory.node.left1 (m p) ∧ root r = Memory.node.right1 (m p)
inductive zipper (α : Type) where
  | Top : zipper α
  | Left : zipper α -> α -> Tree.tree α -> zipper α
axiom inhabited_axiom_zipper {α : Type} [Inhabited α] : Inhabited (zipper α)
attribute [instance] inhabited_axiom_zipper
noncomputable def zip {α : Type} [Inhabited α] : Tree.tree α -> zipper α -> Tree.tree α
  | t, (zipper.Top : zipper α) => t
  | t, (zipper.Left z1 x r) => zip (Tree.tree.Node t x r) z1
noncomputable def inorderz {α : Type} [Inhabited α] : zipper α -> List α
  | (zipper.Top : zipper α) => ([] : List α)
  | (zipper.Left z1 x r) => List.cons x (Inorder.inorder r) ++ inorderz z1
theorem in_zip_tree'vc (m : Memory.loc -> Memory.node) (t : Tree.tree Memory.loc) (z : zipper Memory.loc) (fact0 : istree m (zip t z)) : (match z with | zipper.Top => True | zipper.Left z1 p r => (match z with | zipper.Top => False | zipper.Left f _ _ => f = z1) ∧ istree m (zip (Tree.tree.Node t p r) z1)) ∧ ((match z with | zipper.Top => True | zipper.Left z1 p r => istree m (Tree.tree.Node t p r)) → istree m t)
  := sorry
end verifythis_fm2012_treedel_Treedel_in_zip_treeqtvc
