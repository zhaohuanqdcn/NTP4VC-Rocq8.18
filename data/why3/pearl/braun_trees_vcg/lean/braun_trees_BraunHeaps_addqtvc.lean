import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace braun_trees_BraunHeaps_addqtvc
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
theorem add'vc (t : Tree.tree elt) (x : elt) (fact0 : heap t) (fact1 : inv t) : (match t with | (Tree.tree.Empty : Tree.tree elt) => True | Tree.tree.Node l y r => (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ heap r ∧ inv r) ∧ (∀(result : Tree.tree elt), (match t with | (Tree.tree.Empty : Tree.tree elt) => result = Tree.tree.Node (Tree.tree.Empty : Tree.tree elt) x (Tree.tree.Empty : Tree.tree elt) | Tree.tree.Node l y r => (if le x y then ∃(o1 : Tree.tree elt), (heap o1 ∧ inv o1 ∧ Occ.occ y o1 = Occ.occ y r + (1 : ℤ) ∧ (∀(e : elt), ¬e = y → Occ.occ e o1 = Occ.occ e r) ∧ Size.size o1 = Size.size r + (1 : ℤ)) ∧ result = Tree.tree.Node o1 x l else ∃(o1 : Tree.tree elt), (heap o1 ∧ inv o1 ∧ Occ.occ x o1 = Occ.occ x r + (1 : ℤ) ∧ (∀(e : elt), ¬e = x → Occ.occ e o1 = Occ.occ e r) ∧ Size.size o1 = Size.size r + (1 : ℤ)) ∧ result = Tree.tree.Node o1 y l)) → heap result ∧ inv result ∧ Occ.occ x result = Occ.occ x t + (1 : ℤ) ∧ (∀(e : elt), ¬e = x → Occ.occ e result = Occ.occ e t) ∧ Size.size result = Size.size t + (1 : ℤ))
  := sorry
end braun_trees_BraunHeaps_addqtvc
