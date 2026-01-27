import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
import pearl.pairing_heap_vcg.lean.pairing_heap.Size
import pearl.pairing_heap_vcg.lean.pairing_heap.Occ
open Classical
open Lean4Why3
namespace pairing_heap_PairingHeap_le_roots_transqtvc
axiom le : HeapType.elt -> HeapType.elt -> Prop
axiom Refl (x : HeapType.elt) : le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : le x y ∨ le y x
noncomputable def le_tree (e : HeapType.elt) (t : HeapType.tree) := match t with | HeapType.tree.T x _ => le e x
noncomputable def le_root (e : HeapType.elt) (h : HeapType.raw_heap) := match h with | HeapType.raw_heap.E => True | HeapType.raw_heap.H t => le_tree e t
noncomputable def le_roots : HeapType.elt -> List HeapType.tree -> Prop
  | e, ([] : List HeapType.tree) => True
  | e, (List.cons t r) => le_tree e t ∧ le_roots e r
theorem le_roots_trans'vc (x : HeapType.elt) (y : HeapType.elt) (l : List HeapType.tree) (fact0 : le x y) (fact1 : le_roots y l) : le_roots x l
  := sorry
end pairing_heap_PairingHeap_le_roots_transqtvc
