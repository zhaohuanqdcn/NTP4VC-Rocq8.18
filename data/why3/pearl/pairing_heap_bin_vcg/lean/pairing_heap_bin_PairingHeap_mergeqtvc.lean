import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MySize
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MyOcc
open Classical
open Lean4Why3
namespace pairing_heap_bin_PairingHeap_mergeqtvc
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
theorem merge'vc (h1 : HeapType.heap) (h2 : HeapType.heap) (fact0 : heap h1) (fact1 : heap h2) : (match h2 with | HeapType.heap.E => (match h1 with | HeapType.heap.E => True | _ => True) | HeapType.heap.T x x1 => (match h1 with | HeapType.heap.E => True | HeapType.heap.T x2 x3 => True)) ∧ (∀(result : HeapType.heap), (match h2 with | HeapType.heap.E => (match h1 with | HeapType.heap.E => result = h2 | _ => result = h1) | HeapType.heap.T x x1 => (match h1 with | HeapType.heap.E => result = h2 | HeapType.heap.T x2 x3 => (if le x2 x then result = HeapType.heap.T x2 (Tree.tree.Node x1 x x3) else result = HeapType.heap.T x (Tree.tree.Node x3 x2 x1)))) → heap result ∧ MySize.size result = MySize.size h1 + MySize.size h2 ∧ (∀(x : HeapType.elt), MyOcc.occ x result = MyOcc.occ x h1 + MyOcc.occ x h2))
  := sorry
end pairing_heap_bin_PairingHeap_mergeqtvc
