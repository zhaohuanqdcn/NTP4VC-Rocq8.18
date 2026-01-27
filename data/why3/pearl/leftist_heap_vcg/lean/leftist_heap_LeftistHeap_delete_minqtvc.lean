import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
import pearl.leftist_heap_vcg.lean.leftist_heap.Size
import pearl.leftist_heap_vcg.lean.leftist_heap.Occ
open Classical
open Lean4Why3
namespace leftist_heap_LeftistHeap_delete_minqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def le_root (e : elt) (h : TreeRank.tree elt) := match h with | TreeRank.tree.E => True | TreeRank.tree.N _ _ x _ => le e x
noncomputable def is_heap : TreeRank.tree elt -> Prop
  | (TreeRank.tree.E : TreeRank.tree elt) => True
  | (TreeRank.tree.N x0 l x r) => le_root x l ∧ is_heap l ∧ le_root x r ∧ is_heap r
axiom minimum : TreeRank.tree elt -> elt
axiom minimum_def (s : ℤ) (l : TreeRank.tree elt) (x : elt) (r : TreeRank.tree elt) : minimum (TreeRank.tree.N s l x r) = x
noncomputable def is_minimum (x : elt) (h : TreeRank.tree elt) := Occ.mem x h ∧ (∀(e : elt), Occ.mem e h → le x e)
noncomputable def rank : TreeRank.tree elt -> ℤ
  | (TreeRank.tree.E : TreeRank.tree elt) => (0 : ℤ)
  | (TreeRank.tree.N x l x0 r) => (1 : ℤ) + min (rank l) (rank r)
noncomputable def leftist : TreeRank.tree elt -> Prop
  | (TreeRank.tree.E : TreeRank.tree elt) => True
  | (TreeRank.tree.N s l x r) => s = rank (TreeRank.tree.N s l x r) ∧ leftist l ∧ leftist r ∧ rank r ≤ rank l
noncomputable def leftist_heap (h : TreeRank.tree elt) := is_heap h ∧ leftist h
theorem delete_min'vc (h : TreeRank.tree elt) (fact0 : (0 : ℤ) < Size.size h) (fact1 : leftist_heap h) : (match h with | TreeRank.tree.E => False | TreeRank.tree.N _ l _ r => leftist_heap l ∧ leftist_heap r) ∧ (∀(result : TreeRank.tree elt), (match h with | TreeRank.tree.E => False | TreeRank.tree.N _ l _ r => Size.size result = Size.size l + Size.size r ∧ (∀(x : elt), Occ.occ x result = Occ.occ x l + Occ.occ x r) ∧ leftist_heap result) → Occ.occ (minimum h) result = Occ.occ (minimum h) h - (1 : ℤ) ∧ (∀(x : elt), ¬x = minimum h → Occ.occ x result = Occ.occ x h) ∧ Size.size result = Size.size h - (1 : ℤ) ∧ leftist_heap result)
  := sorry
end leftist_heap_LeftistHeap_delete_minqtvc
