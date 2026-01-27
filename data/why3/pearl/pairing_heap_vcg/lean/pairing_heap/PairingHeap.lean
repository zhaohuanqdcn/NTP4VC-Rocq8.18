import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
import pearl.pairing_heap_vcg.lean.pairing_heap.Size
import pearl.pairing_heap_vcg.lean.pairing_heap.Occ
open Classical
open Lean4Why3
namespace PairingHeap
axiom le : HeapType.elt -> HeapType.elt -> Prop
axiom Refl (x : HeapType.elt) : le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : le x y ∨ le y x
noncomputable def le_tree (e : HeapType.elt) (t : HeapType.tree) := match t with | HeapType.tree.T x _ => le e x
noncomputable def le_root (e : HeapType.elt) (h1 : HeapType.raw_heap) := match h1 with | HeapType.raw_heap.E => True | HeapType.raw_heap.H t => le_tree e t
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
noncomputable def is_minimum_tree (x : HeapType.elt) (t : HeapType.tree) := Occ.mem_tree x t ∧ (∀(e : HeapType.elt), Occ.mem_tree e t → le x e)
noncomputable def is_minimum (x : HeapType.elt) (h1 : HeapType.raw_heap) := Occ.mem x h1 ∧ (∀(e : HeapType.elt), Occ.mem e h1 → le x e)
axiom minimum_tree : HeapType.tree -> HeapType.elt
axiom minimum_tree_def (x : HeapType.elt) (l : List HeapType.tree) : minimum_tree (HeapType.tree.T x l) = x
axiom minimum : HeapType.raw_heap -> HeapType.elt
axiom minimum_def (t : HeapType.tree) : minimum (HeapType.raw_heap.H t) = minimum_tree t
noncomputable def minimum_heap (hh : heap1) := minimum (h hh)
axiom empty : heap1
axiom empty'def : Size.size_heap (h empty) = (0 : ℤ) ∧ (∀(e : HeapType.elt), ¬Occ.mem e (h empty))
end PairingHeap
