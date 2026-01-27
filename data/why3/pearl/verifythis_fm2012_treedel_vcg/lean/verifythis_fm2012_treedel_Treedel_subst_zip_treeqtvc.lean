import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_treedel_vcg.lean.verifythis_fm2012_treedel.Memory
import Why3.bintree.Tree
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Treedel_subst_zip_treeqtvc
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
theorem subst_zip_tree'vc (m : Memory.loc -> Memory.node) (t1 : Tree.tree Memory.loc) (z : zipper Memory.loc) (m' : Memory.loc -> Memory.node) (t2 : Tree.tree Memory.loc) (fact0 : istree m (zip t1 z)) (fact1 : istree m' t2) (fact2 : root t1 = root t2) (fact3 : List.Nodup (Inorder.inorder (zip t1 z))) (fact4 : ∀(x : Memory.loc), ¬m x = m' x → x ∈ Inorder.inorder t1) : (match z with | zipper.Top => True | zipper.Left z1 p r => (let t3 : Tree.tree Memory.loc := Tree.tree.Node t1 p r; istree m (zip t3 z1) ∧ (istree m t3 → (istree m r ∧ (∀(p1 : Memory.loc), p1 ∈ Inorder.inorder r → Memory.node.left1 (m p1) = Memory.node.left1 (m' p1) ∧ Memory.node.right1 (m p1) = Memory.node.right1 (m' p1))) ∧ (istree m' r → (let o1 : Tree.tree Memory.loc := Tree.tree.Node t2 p r; (match z with | zipper.Top => False | zipper.Left f _ _ => f = z1) ∧ (istree m (zip t3 z1) ∧ istree m' o1) ∧ root t3 = root o1 ∧ List.Nodup (Inorder.inorder (zip t3 z1)) ∧ (∀(x : Memory.loc), ¬m x = m' x → x ∈ Inorder.inorder t3)))))) ∧ ((match z with | zipper.Top => True | zipper.Left z1 p r => (let t3 : Tree.tree Memory.loc := Tree.tree.Node t1 p r; istree m t3 ∧ istree m' r ∧ (let o1 : Tree.tree Memory.loc := Tree.tree.Node t2 p r; istree m' (zip o1 z1) ∧ root (zip t3 z1) = root (zip o1 z1)))) → istree m' (zip t2 z) ∧ root (zip t1 z) = root (zip t2 z))
  := sorry
end verifythis_fm2012_treedel_Treedel_subst_zip_treeqtvc
