import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace braun_trees_BraunHeaps_mergeqtvc
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
theorem merge'vc (l : Tree.tree elt) (r : Tree.tree elt) (fact0 : heap l) (fact1 : heap r) (fact2 : inv l) (fact3 : inv r) (fact4 : Size.size r ≤ Size.size l) (fact5 : Size.size l ≤ Size.size r + (1 : ℤ)) : (match r with | (Tree.tree.Empty : Tree.tree elt) => (match l with | (Tree.tree.Empty : Tree.tree elt) => True | _ => True) | Tree.tree.Node x x1 x2 => (match l with | Tree.tree.Node x3 x4 x5 => (if le x4 x1 then ((0 : ℤ) ≤ Size.size l + Size.size r ∧ Size.size x3 + Size.size x5 < Size.size l + Size.size r) ∧ (heap x3 ∧ heap x5) ∧ (inv x3 ∧ inv x5) ∧ Size.size x5 ≤ Size.size x3 ∧ Size.size x3 ≤ Size.size x5 + (1 : ℤ) else (heap l ∧ inv l ∧ (0 : ℤ) < Size.size l) ∧ (∀(x6 : elt) (l1 : Tree.tree elt), heap l1 ∧ inv l1 ∧ Size.size l1 = Size.size l - (1 : ℤ) ∧ Occ.occ x6 l1 = Occ.occ x6 l - (1 : ℤ) ∧ (∀(x7 : elt), ¬x7 = x6 → Occ.occ x7 l1 = Occ.occ x7 l) → heap r ∧ inv r ∧ (0 : ℤ) < Size.size r)) | (Tree.tree.Empty : Tree.tree elt) => False)) ∧ (∀(result : Tree.tree elt), (match r with | (Tree.tree.Empty : Tree.tree elt) => (match l with | (Tree.tree.Empty : Tree.tree elt) => result = l | _ => result = l) | Tree.tree.Node x x1 x2 => (match l with | Tree.tree.Node x3 x4 x5 => (if le x4 x1 then ∃(o1 : Tree.tree elt), (heap o1 ∧ inv o1 ∧ (∀(e : elt), Occ.occ e o1 = Occ.occ e x3 + Occ.occ e x5) ∧ Size.size o1 = Size.size x3 + Size.size x5) ∧ result = Tree.tree.Node r x4 o1 else ∃(e : elt) (t' : Tree.tree elt), (heap t' ∧ inv t' ∧ Size.size t' = Size.size l - (1 : ℤ) ∧ Occ.occ e t' = Occ.occ e l - (1 : ℤ) ∧ (∀(x6 : elt), ¬x6 = e → Occ.occ x6 t' = Occ.occ x6 l)) ∧ (∃(o1 : Tree.tree elt), (heap o1 ∧ inv o1 ∧ (if e = minimum r then Occ.occ e o1 = Occ.occ e r else Occ.occ e o1 = Occ.occ e r + (1 : ℤ) ∧ Occ.occ (minimum r) o1 = Occ.occ (minimum r) r - (1 : ℤ)) ∧ (∀(e1 : elt), ¬e1 = e → ¬e1 = minimum r → Occ.occ e1 o1 = Occ.occ e1 r) ∧ Size.size o1 = Size.size r) ∧ result = Tree.tree.Node o1 x1 t')) | (Tree.tree.Empty : Tree.tree elt) => False)) → heap result ∧ inv result ∧ (∀(e : elt), Occ.occ e result = Occ.occ e l + Occ.occ e r) ∧ Size.size result = Size.size l + Size.size r)
  := sorry
end braun_trees_BraunHeaps_mergeqtvc
