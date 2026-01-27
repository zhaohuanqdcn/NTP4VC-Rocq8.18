import Why3.Base
import pearl.leftist_heap_vcg.lean.leftist_heap.TreeRank
import pearl.leftist_heap_vcg.lean.leftist_heap.Size
import pearl.leftist_heap_vcg.lean.leftist_heap.Occ
open Classical
open Lean4Why3
namespace leftist_heap_LeftistHeap_mergeqtvc
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
theorem merge'vc (h1 : TreeRank.tree elt) (h2 : TreeRank.tree elt) (fact0 : leftist_heap h1) (fact1 : leftist_heap h2) : (match h2 with | TreeRank.tree.E => (match h1 with | TreeRank.tree.E => True | _ => True) | TreeRank.tree.N x x1 x2 x3 => (match h1 with | TreeRank.tree.E => True | TreeRank.tree.N x4 x5 x6 x7 => (if le x6 x2 then (((0 : ℤ) ≤ Size.size h1 + Size.size h2 ∧ Size.size x7 + Size.size h2 < Size.size h1 + Size.size h2) ∧ leftist_heap x7 ∧ leftist_heap h2) ∧ (∀(o1 : TreeRank.tree elt), Size.size o1 = Size.size x7 + Size.size h2 ∧ (∀(x8 : elt), Occ.occ x8 o1 = Occ.occ x8 x7 + Occ.occ x8 h2) ∧ leftist_heap o1 → (leftist_heap o1 ∧ leftist_heap x5) ∧ le_root x6 x5 ∧ le_root x6 o1) else (((0 : ℤ) ≤ Size.size h1 + Size.size h2 ∧ Size.size h1 + Size.size x3 < Size.size h1 + Size.size h2) ∧ leftist_heap h1 ∧ leftist_heap x3) ∧ (∀(o1 : TreeRank.tree elt), Size.size o1 = Size.size h1 + Size.size x3 ∧ (∀(x8 : elt), Occ.occ x8 o1 = Occ.occ x8 h1 + Occ.occ x8 x3) ∧ leftist_heap o1 → (leftist_heap o1 ∧ leftist_heap x1) ∧ le_root x2 x1 ∧ le_root x2 o1)))) ∧ (∀(result : TreeRank.tree elt), (match h2 with | TreeRank.tree.E => (match h1 with | TreeRank.tree.E => result = h1 | _ => result = h1) | TreeRank.tree.N x x1 x2 x3 => (match h1 with | TreeRank.tree.E => result = h2 | TreeRank.tree.N x4 x5 x6 x7 => (if le x6 x2 then ∃(o1 : TreeRank.tree elt), (Size.size o1 = Size.size x7 + Size.size h2 ∧ (∀(x8 : elt), Occ.occ x8 o1 = Occ.occ x8 x7 + Occ.occ x8 h2) ∧ leftist_heap o1) ∧ leftist_heap result ∧ minimum result = x6 ∧ Size.size result = (1 : ℤ) + Size.size x5 + Size.size o1 ∧ Occ.occ x6 result = (1 : ℤ) + Occ.occ x6 x5 + Occ.occ x6 o1 ∧ (∀(y : elt), ¬x6 = y → Occ.occ y result = Occ.occ y x5 + Occ.occ y o1) else ∃(o1 : TreeRank.tree elt), (Size.size o1 = Size.size h1 + Size.size x3 ∧ (∀(x8 : elt), Occ.occ x8 o1 = Occ.occ x8 h1 + Occ.occ x8 x3) ∧ leftist_heap o1) ∧ leftist_heap result ∧ minimum result = x2 ∧ Size.size result = (1 : ℤ) + Size.size x1 + Size.size o1 ∧ Occ.occ x2 result = (1 : ℤ) + Occ.occ x2 x1 + Occ.occ x2 o1 ∧ (∀(y : elt), ¬x2 = y → Occ.occ y result = Occ.occ y x1 + Occ.occ y o1)))) → Size.size result = Size.size h1 + Size.size h2 ∧ (∀(x : elt), Occ.occ x result = Occ.occ x h1 + Occ.occ x h2) ∧ leftist_heap result)
  := sorry
end leftist_heap_LeftistHeap_mergeqtvc
