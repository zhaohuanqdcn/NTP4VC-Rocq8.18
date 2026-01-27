import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace braun_trees_BraunHeaps_extractqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
noncomputable def le_root (e : elt) (t : Tree.tree elt) := match t with | (Tree.tree.Empty : Tree.tree elt) => True | Tree.tree.Node _ x _ => le e x
noncomputable def heap : Tree.tree elt -> Prop
  | (Tree.tree.Empty : Tree.tree elt) => True
  | (Tree.tree.Node l x r) => le_root x l ∧ heap l ∧ le_root x r ∧ heap r
axiom minimum : Tree.tree elt -> elt
axiom minimum_def (l : Tree.tree elt) (x : elt) (r : Tree.tree elt) : minimum (Tree.tree.Node l x r) = x
noncomputable def is_minimum (x : elt) (t : Tree.tree elt) := Occ.mem x t ∧ (∀(e : elt), Occ.mem e t → le x e)
noncomputable def inv : Tree.tree elt -> Prop
  | (Tree.tree.Empty : Tree.tree elt) => True
  | (Tree.tree.Node l x r) => (Size.size l = Size.size r ∨ Size.size l = Size.size r + (1 : ℤ)) ∧ inv l ∧ inv r
axiom empty : Tree.tree elt
axiom empty'def : heap empty ∧ inv empty ∧ Size.size empty = (0 : ℤ) ∧ (∀(e : elt), ¬Occ.mem e empty)
theorem extract'vc (t : Tree.tree elt) (fact0 : heap t) (fact1 : inv t) (fact2 : (0 : ℤ) < Size.size t) : (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node (Tree.tree.Empty : Tree.tree elt) y r => True | Tree.tree.Node l y r => (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ heap l ∧ inv l ∧ (0 : ℤ) < Size.size l) ∧ (∀(e : elt) (t' : Tree.tree elt), (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node (Tree.tree.Empty : Tree.tree elt) y r => e = y ∧ t' = (Tree.tree.Empty : Tree.tree elt) | Tree.tree.Node l y r => (∃(t'1 : Tree.tree elt), (heap t'1 ∧ inv t'1 ∧ Size.size t'1 = Size.size l - (1 : ℤ) ∧ Occ.occ e t'1 = Occ.occ e l - (1 : ℤ) ∧ (∀(x : elt), ¬x = e → Occ.occ x t'1 = Occ.occ x l)) ∧ t' = Tree.tree.Node r y t'1)) → heap t' ∧ inv t' ∧ Size.size t' = Size.size t - (1 : ℤ) ∧ Occ.occ e t' = Occ.occ e t - (1 : ℤ) ∧ (∀(x : elt), ¬x = e → Occ.occ x t' = Occ.occ x t))
  := sorry
end braun_trees_BraunHeaps_extractqtvc
