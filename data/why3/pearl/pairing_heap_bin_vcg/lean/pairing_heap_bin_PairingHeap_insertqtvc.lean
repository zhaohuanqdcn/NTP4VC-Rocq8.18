import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MySize
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MyOcc
open Classical
open Lean4Why3
namespace pairing_heap_bin_PairingHeap_insertqtvc
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
theorem insert'vc (h : HeapType.heap) (x : HeapType.elt) (fact0 : heap h) : let o1 : HeapType.heap := HeapType.heap.T x (Tree.tree.Empty : Tree.tree HeapType.elt); (heap o1 ∧ heap h) ∧ (∀(result : HeapType.heap), heap result ∧ MySize.size result = MySize.size o1 + MySize.size h ∧ (∀(x1 : HeapType.elt), MyOcc.occ x1 result = MyOcc.occ x1 o1 + MyOcc.occ x1 h) → heap result ∧ MyOcc.occ x result = MyOcc.occ x h + (1 : ℤ) ∧ (∀(y : HeapType.elt), ¬x = y → MyOcc.occ y result = MyOcc.occ y h) ∧ MySize.size result = MySize.size h + (1 : ℤ))
  := sorry
end pairing_heap_bin_PairingHeap_insertqtvc
