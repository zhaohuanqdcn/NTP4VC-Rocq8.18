import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Size
import Why3.bintree.Occ
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MySize
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.MyOcc
open Classical
open Lean4Why3
namespace pairing_heap_bin_PairingHeap_le_root_transqtvc
axiom le : HeapType.elt -> HeapType.elt -> Prop
axiom Refl (x : HeapType.elt) : le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : le x y ∨ le y x
noncomputable def le_root (e : HeapType.elt) (h : HeapType.heap) := match h with | HeapType.heap.E => True | HeapType.heap.T x _ => le e x
theorem le_root_trans'vc (x : HeapType.elt) (y : HeapType.elt) (h : HeapType.heap) (fact0 : le x y) (fact1 : le_root y h) : le_root x h
  := sorry
end pairing_heap_bin_PairingHeap_le_root_transqtvc
