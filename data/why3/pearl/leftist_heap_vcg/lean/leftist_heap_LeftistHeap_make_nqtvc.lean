import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
import pearl.leftist_heap_vcg.lean.leftist_heap.Size
import pearl.leftist_heap_vcg.lean.leftist_heap.Occ
open Classical
open Lean4Why3
namespace leftist_heap_LeftistHeap_make_nqtvc
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
theorem make_n'vc (r : TreeRank.tree elt) (l : TreeRank.tree elt) (x : elt) (fact0 : leftist_heap r) (fact1 : leftist_heap l) (fact2 : le_root x l) (fact3 : le_root x r) : leftist_heap r ∧ (let o1 : ℤ := rank r; leftist_heap l ∧ (let o2 : ℤ := rank l; (if o1 ≤ o2 then leftist_heap r else leftist_heap l) ∧ (∀(result : TreeRank.tree elt), (if o1 ≤ o2 then result = TreeRank.tree.N (rank r + (1 : ℤ)) l x r else result = TreeRank.tree.N (rank l + (1 : ℤ)) r x l) → leftist_heap result ∧ minimum result = x ∧ Size.size result = (1 : ℤ) + Size.size l + Size.size r ∧ Occ.occ x result = (1 : ℤ) + Occ.occ x l + Occ.occ x r ∧ (∀(y : elt), ¬x = y → Occ.occ y result = Occ.occ y l + Occ.occ y r))))
  := sorry
end leftist_heap_LeftistHeap_make_nqtvc
