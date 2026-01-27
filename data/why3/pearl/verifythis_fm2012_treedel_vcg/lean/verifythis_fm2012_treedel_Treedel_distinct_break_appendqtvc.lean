import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_treedel_vcg.lean.verifythis_fm2012_treedel.Memory
import Why3.bintree.Tree
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Treedel_distinct_break_appendqtvc
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
theorem distinct_break_append'vc {α : Type} [Inhabited α] (l1 : List α) (l2 : List α) (fact0 : List.Nodup (l1 ++ l2)) : List.Nodup l1 ∧ List.Nodup l2 ∧ (∀(x : α), x ∈ l1 → ¬x ∈ l2)
  := sorry
end verifythis_fm2012_treedel_Treedel_distinct_break_appendqtvc
