import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MySize
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MyOcc
open Classical
open Lean4Why3
namespace pairing_heap_bin_PairingHeap_merge_pairsqtvc
axiom le : HeapType.elt -> HeapType.elt -> Prop
axiom Refl (x : HeapType.elt) : le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : le x y ∨ le y x
noncomputable def le_root (e : HeapType.elt) (h : HeapType.heap) := match h with | HeapType.heap.E => True | HeapType.heap.T x _ => le e x
noncomputable def le_root_tree : HeapType.elt -> Tree.tree HeapType.elt -> Prop
  | e, (Tree.tree.Empty : Tree.tree HeapType.elt) => True
  | e, (Tree.tree.Node x0 x r) => le e x ∧ le_root_tree e r
noncomputable def heap_tree : Tree.tree HeapType.elt -> Prop
  | (Tree.tree.Empty : Tree.tree HeapType.elt) => True
  | (Tree.tree.Node l x r) => le_root_tree x l ∧ heap_tree l ∧ heap_tree r
noncomputable def heap (h : HeapType.heap) := match h with | HeapType.heap.E => True | HeapType.heap.T x r => le_root_tree x r ∧ heap_tree r
axiom minimum : HeapType.heap -> HeapType.elt
axiom minimum_def (x : HeapType.elt) (r : Tree.tree HeapType.elt) : minimum (HeapType.heap.T x r) = x
noncomputable def is_minimum (x : HeapType.elt) (h : HeapType.heap) := MyOcc.mem x h ∧ (∀(e : HeapType.elt), MyOcc.mem e h → le x e)
axiom empty : HeapType.heap
axiom empty'def : heap empty ∧ MySize.size empty = (0 : ℤ) ∧ (∀(e : HeapType.elt), ¬MyOcc.mem e empty)
theorem merge_pairs'vc (t : Tree.tree HeapType.elt) (fact0 : heap_tree t) : (match t with | (Tree.tree.Empty : Tree.tree HeapType.elt) => True | Tree.tree.Node l x (Tree.tree.Empty : Tree.tree HeapType.elt) => True | Tree.tree.Node l x (Tree.tree.Node l2 y r) => (let h : HeapType.heap := HeapType.heap.T x l; let h' : HeapType.heap := HeapType.heap.T y l2; (((0 : ℤ) ≤ Size.size t ∧ Size.size r < Size.size t) ∧ heap_tree r) ∧ (∀(o1 : HeapType.heap), heap o1 ∧ MySize.size o1 = Size.size r ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 o1 = Occ.occ x1 r) → (heap h ∧ heap h') ∧ (∀(o2 : HeapType.heap), heap o2 ∧ MySize.size o2 = MySize.size h + MySize.size h' ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 o2 = MyOcc.occ x1 h + MyOcc.occ x1 h') → heap o2 ∧ heap o1)))) ∧ (∀(result : HeapType.heap), (match t with | (Tree.tree.Empty : Tree.tree HeapType.elt) => result = HeapType.heap.E | Tree.tree.Node l x (Tree.tree.Empty : Tree.tree HeapType.elt) => result = HeapType.heap.T x l | Tree.tree.Node l x (Tree.tree.Node l2 y r) => (let h : HeapType.heap := HeapType.heap.T x l; let h' : HeapType.heap := HeapType.heap.T y l2; ∃(o1 : HeapType.heap), (heap o1 ∧ MySize.size o1 = Size.size r ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 o1 = Occ.occ x1 r)) ∧ (∃(o2 : HeapType.heap), (heap o2 ∧ MySize.size o2 = MySize.size h + MySize.size h' ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 o2 = MyOcc.occ x1 h + MyOcc.occ x1 h')) ∧ heap result ∧ MySize.size result = MySize.size o2 + MySize.size o1 ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 result = MyOcc.occ x1 o2 + MyOcc.occ x1 o1)))) → heap result ∧ MySize.size result = Size.size t ∧ (∀(x : HeapType.elt), MyOcc.occ x result = Occ.occ x t))
  := sorry
end pairing_heap_bin_PairingHeap_merge_pairsqtvc
