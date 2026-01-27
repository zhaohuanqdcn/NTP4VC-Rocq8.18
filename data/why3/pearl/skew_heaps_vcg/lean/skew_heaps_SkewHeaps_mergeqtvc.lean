import Why3.Base
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace skew_heaps_SkewHeaps_mergeqtvc
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
theorem merge'vc (t1 : Tree.tree elt) (t2 : Tree.tree elt) (fact0 : heap t1) (fact1 : heap t2) : (match t2 with | (Tree.tree.Empty : Tree.tree elt) => (match t1 with | (Tree.tree.Empty : Tree.tree elt) => True | _ => True) | Tree.tree.Node x x1 x2 => (match t1 with | (Tree.tree.Empty : Tree.tree elt) => True | Tree.tree.Node x3 x4 x5 => (if le x4 x1 then ((0 : ℤ) ≤ Size.size t1 + Size.size t2 ∧ Size.size x5 + Size.size t2 < Size.size t1 + Size.size t2) ∧ heap x5 ∧ heap t2 else ((0 : ℤ) ≤ Size.size t1 + Size.size t2 ∧ Size.size x2 + Size.size t1 < Size.size t1 + Size.size t2) ∧ heap x2 ∧ heap t1))) ∧ (∀(result : Tree.tree elt), (match t2 with | (Tree.tree.Empty : Tree.tree elt) => (match t1 with | (Tree.tree.Empty : Tree.tree elt) => result = t2 | _ => result = t1) | Tree.tree.Node x x1 x2 => (match t1 with | (Tree.tree.Empty : Tree.tree elt) => result = t2 | Tree.tree.Node x3 x4 x5 => (if le x4 x1 then ∃(o1 : Tree.tree elt), (heap o1 ∧ (∀(e : elt), Occ.occ e o1 = Occ.occ e x5 + Occ.occ e t2) ∧ Size.size o1 = Size.size x5 + Size.size t2) ∧ result = Tree.tree.Node o1 x4 x3 else ∃(o1 : Tree.tree elt), (heap o1 ∧ (∀(e : elt), Occ.occ e o1 = Occ.occ e x2 + Occ.occ e t1) ∧ Size.size o1 = Size.size x2 + Size.size t1) ∧ result = Tree.tree.Node o1 x1 x))) → heap result ∧ (∀(e : elt), Occ.occ e result = Occ.occ e t1 + Occ.occ e t2) ∧ Size.size result = Size.size t1 + Size.size t2)
  := sorry
end skew_heaps_SkewHeaps_mergeqtvc
