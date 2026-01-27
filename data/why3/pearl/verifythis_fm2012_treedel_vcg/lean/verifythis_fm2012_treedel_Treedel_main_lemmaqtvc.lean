import Why3.Base
import Why3.why3.Ref.Ref
import pearl.verifythis_fm2012_treedel_vcg.lean.verifythis_fm2012_treedel.Memory
import Why3.bintree.Tree
import Why3.bintree.Inorder
open Classical
open Lean4Why3
namespace verifythis_fm2012_treedel_Treedel_main_lemmaqtvc
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
theorem main_lemma'vc (p : Memory.loc) (pr : Tree.tree Memory.loc) (pp : Memory.loc) (ppr : Tree.tree Memory.loc) (z : zipper Memory.loc) (m : Memory.loc -> Memory.node) (fact0 : let it : Tree.tree Memory.loc := zip (Tree.tree.Node (Tree.tree.Node (Tree.tree.Empty : Tree.tree Memory.loc) p pr) pp ppr) z; istree m it ∧ List.Nodup (Inorder.inorder it)) : let t2 : Tree.tree Memory.loc := Tree.tree.Node pr pp ppr; istree (Function.update m pp (let x_q' : Memory.node := m pp; Memory.node.mk (Memory.node.right1 (m p)) (Memory.node.right1 x_q') (Memory.node.data x_q'))) (zip t2 z) ∧ root (zip (Tree.tree.Node (Tree.tree.Node (Tree.tree.Empty : Tree.tree Memory.loc) p pr) pp ppr) z) = root (zip t2 z)
  := sorry
end verifythis_fm2012_treedel_Treedel_main_lemmaqtvc
