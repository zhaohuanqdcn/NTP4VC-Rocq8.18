import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace skew_heaps_SkewHeaps_addqtvc
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
axiom empty : Tree.tree elt
axiom empty'def : heap empty ∧ Size.size empty = (0 : ℤ) ∧ (∀(e : elt), ¬Occ.mem e empty)
theorem add'vc (t : Tree.tree elt) (x : elt) (fact0 : heap t) : let o1 : Tree.tree elt := Tree.tree.Node (Tree.tree.Empty : Tree.tree elt) x (Tree.tree.Empty : Tree.tree elt); (heap o1 ∧ heap t) ∧ (∀(result : Tree.tree elt), heap result ∧ (∀(e : elt), Occ.occ e result = Occ.occ e o1 + Occ.occ e t) ∧ Size.size result = Size.size o1 + Size.size t → heap result ∧ Occ.occ x result = Occ.occ x t + (1 : ℤ) ∧ (∀(e : elt), ¬e = x → Occ.occ e result = Occ.occ e t) ∧ Size.size result = Size.size t + (1 : ℤ))
  := sorry
end skew_heaps_SkewHeaps_addqtvc
