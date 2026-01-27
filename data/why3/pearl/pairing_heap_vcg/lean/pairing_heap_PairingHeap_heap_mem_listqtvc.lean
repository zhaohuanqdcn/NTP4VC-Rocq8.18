import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
import pearl.pairing_heap_vcg.lean.pairing_heap.Size
import pearl.pairing_heap_vcg.lean.pairing_heap.Occ
open Classical
open Lean4Why3
namespace pairing_heap_PairingHeap_heap_mem_listqtvc
axiom le : HeapType.elt -> HeapType.elt -> Prop
axiom Refl (x : HeapType.elt) : le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : le x y ∨ le y x
noncomputable def le_tree (e : HeapType.elt) (t : HeapType.tree) := match t with | HeapType.tree.T x _ => le e x
noncomputable def le_root (e : HeapType.elt) (h : HeapType.raw_heap) := match h with | HeapType.raw_heap.E => True | HeapType.raw_heap.H t => le_tree e t
noncomputable def le_roots : HeapType.elt -> List HeapType.tree -> Prop
  | e, ([] : List HeapType.tree) => True
  | e, (List.cons t r) => le_tree e t ∧ le_roots e r
mutual
noncomputable def heap : HeapType.raw_heap -> Prop
  | HeapType.raw_heap.E => True
  | (HeapType.raw_heap.H t) => heap_tree t
noncomputable def heap_tree : HeapType.tree -> Prop
  | (HeapType.tree.T x l) => le_roots x l ∧ heap_list l
noncomputable def heap_list : List HeapType.tree -> Prop
  | ([] : List HeapType.tree) => True
  | (List.cons t r) => heap_tree t ∧ heap_list r
end
axiom heap1 : Type
axiom inhabited_axiom_heap1 : Inhabited heap1
attribute [instance] inhabited_axiom_heap1
axiom h : heap1 -> HeapType.raw_heap
axiom heap'invariant (self : heap1) : heap (h self)
noncomputable def heap'eq (a : heap1) (b : heap1) := h a = h b
axiom heap'inj (a : heap1) (b : heap1) (fact0 : heap'eq a b) : a = b
noncomputable def size (hh : heap1) := Size.size_heap (h hh)
noncomputable def occ (e : HeapType.elt) (hh : heap1) := Occ.occ_heap e (h hh)
theorem heap_mem_list'vc (l : List HeapType.tree) (x : HeapType.elt) (y : HeapType.elt) (fact0 : heap_list l) (fact1 : le_roots x l) (fact2 : Occ.mem_list y l) : le x y
  := sorry
end pairing_heap_PairingHeap_heap_mem_listqtvc
