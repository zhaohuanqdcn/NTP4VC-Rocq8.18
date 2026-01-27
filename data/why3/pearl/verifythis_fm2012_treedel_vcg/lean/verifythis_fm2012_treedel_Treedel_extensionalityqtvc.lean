import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_treedel_vcg.lean.verifythis_fm2012_treedel.Memory
import Why3.bintree.Tree
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Treedel_extensionalityqtvc
noncomputable def root (t : Tree.tree Memory.loc) := match t with | (Tree.tree.Empty : Tree.tree Memory.loc) => Memory.null | Tree.tree.Node _ p _ => p
noncomputable def istree : (Memory.loc -> Memory.node) -> Tree.tree Memory.loc -> Prop
  | m, (Tree.tree.Empty : Tree.tree Memory.loc) => True
  | m, (Tree.tree.Node l p r) => ¬p = Memory.null ∧ istree m l ∧ istree m r ∧ root l = Memory.node.left1 (m p) ∧ root r = Memory.node.right1 (m p)
theorem extensionality'vc (m : Memory.loc -> Memory.node) (t : Tree.tree Memory.loc) (m' : Memory.loc -> Memory.node) (fact0 : istree m t) (fact1 : ∀(p : Memory.loc), p ∈ Inorder.inorder t → Memory.node.left1 (m p) = Memory.node.left1 (m' p) ∧ Memory.node.right1 (m p) = Memory.node.right1 (m' p)) : istree m' t
  := sorry
end verifythis_fm2012_treedel_Treedel_extensionalityqtvc
