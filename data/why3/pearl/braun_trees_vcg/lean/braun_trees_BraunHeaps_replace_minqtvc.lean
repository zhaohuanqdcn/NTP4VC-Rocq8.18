import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace braun_trees_BraunHeaps_replace_minqtvc
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
theorem replace_min'vc (t : Tree.tree elt) (x : elt) (fact0 : heap t) (fact1 : inv t) (fact2 : (0 : ℤ) < Size.size t) : (match t with | Tree.tree.Node l _ r => (∀(o1 : Bool), (if le_root x l then o1 = (if le_root x r then true else false) else o1 = false) → ¬o1 = true → (heap l ∧ (0 : ℤ) < Size.size l) ∧ (if le_root (minimum l) r then (match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = l ∨ f1 = l) ∧ heap l ∧ inv l ∧ (0 : ℤ) < Size.size l else ((match t with | (Tree.tree.Empty : Tree.tree elt) => False | Tree.tree.Node f _ f1 => f = r ∨ f1 = r) ∧ heap r ∧ inv r ∧ (0 : ℤ) < Size.size r) ∧ (∀(o2 : Tree.tree elt), heap o2 ∧ inv o2 ∧ (if x = minimum r then Occ.occ x o2 = Occ.occ x r else Occ.occ x o2 = Occ.occ x r + (1 : ℤ) ∧ Occ.occ (minimum r) o2 = Occ.occ (minimum r) r - (1 : ℤ)) ∧ (∀(e : elt), ¬e = x → ¬e = minimum r → Occ.occ e o2 = Occ.occ e r) ∧ Size.size o2 = Size.size r → heap r ∧ (0 : ℤ) < Size.size r))) | (Tree.tree.Empty : Tree.tree elt) => False) ∧ (∀(result : Tree.tree elt), (match t with | Tree.tree.Node l _ r => (∃(o1 : Bool), (if le_root x l then o1 = (if le_root x r then true else false) else o1 = false) ∧ (if o1 = true then result = Tree.tree.Node l x r else let lx : elt := minimum l; if le_root lx r then ∃(o2 : Tree.tree elt), (heap o2 ∧ inv o2 ∧ (if x = minimum l then Occ.occ x o2 = Occ.occ x l else Occ.occ x o2 = Occ.occ x l + (1 : ℤ) ∧ Occ.occ (minimum l) o2 = Occ.occ (minimum l) l - (1 : ℤ)) ∧ (∀(e : elt), ¬e = x → ¬e = minimum l → Occ.occ e o2 = Occ.occ e l) ∧ Size.size o2 = Size.size l) ∧ result = Tree.tree.Node o2 lx r else ∃(o2 : Tree.tree elt), (heap o2 ∧ inv o2 ∧ (if x = minimum r then Occ.occ x o2 = Occ.occ x r else Occ.occ x o2 = Occ.occ x r + (1 : ℤ) ∧ Occ.occ (minimum r) o2 = Occ.occ (minimum r) r - (1 : ℤ)) ∧ (∀(e : elt), ¬e = x → ¬e = minimum r → Occ.occ e o2 = Occ.occ e r) ∧ Size.size o2 = Size.size r) ∧ result = Tree.tree.Node l (minimum r) o2)) | (Tree.tree.Empty : Tree.tree elt) => False) → heap result ∧ inv result ∧ (if x = minimum t then Occ.occ x result = Occ.occ x t else Occ.occ x result = Occ.occ x t + (1 : ℤ) ∧ Occ.occ (minimum t) result = Occ.occ (minimum t) t - (1 : ℤ)) ∧ (∀(e : elt), ¬e = x → ¬e = minimum t → Occ.occ e result = Occ.occ e t) ∧ Size.size result = Size.size t)
  := sorry
end braun_trees_BraunHeaps_replace_minqtvc
