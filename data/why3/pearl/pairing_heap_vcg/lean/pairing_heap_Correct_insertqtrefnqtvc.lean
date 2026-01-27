import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
import pearl.pairing_heap_vcg.lean.pairing_heap.Size
import pearl.pairing_heap_vcg.lean.pairing_heap.Occ
import pearl.pairing_heap_vcg.lean.pairing_heap.PairingHeap
open Classical
open Lean4Why3
namespace pairing_heap_Correct_insertqtrefnqtvc
axiom Refl (x : HeapType.elt) : PairingHeap.le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : PairingHeap.le x y) (fact1 : PairingHeap.le y z) : PairingHeap.le x z
axiom Total (x : HeapType.elt) (y : HeapType.elt) : PairingHeap.le x y ∨ PairingHeap.le y x
noncomputable def mem (x : HeapType.elt) (h : PairingHeap.heap1) := (0 : ℤ) < PairingHeap.occ x h
noncomputable def is_minimum (x : HeapType.elt) (h : PairingHeap.heap1) := mem x h ∧ (∀(e : HeapType.elt), mem e h → PairingHeap.le x e)
axiom min_def (h : PairingHeap.heap1) (fact0 : (0 : ℤ) < PairingHeap.size h) : is_minimum (PairingHeap.minimum_heap h) h
theorem insert'refn'vc (result : PairingHeap.heap1) (h : PairingHeap.heap1) (x : HeapType.elt) (fact0 : Size.size_heap (PairingHeap.h result) = Size.size_heap (PairingHeap.h h) + (1 : ℤ)) (fact1 : Occ.occ_heap x (PairingHeap.h result) = Occ.occ_heap x (PairingHeap.h h) + (1 : ℤ)) (fact2 : ∀(y : HeapType.elt), ¬x = y → Occ.occ_heap y (PairingHeap.h result) = Occ.occ_heap y (PairingHeap.h h)) : PairingHeap.occ x result = PairingHeap.occ x h + (1 : ℤ) ∧ (∀(y : HeapType.elt), ¬y = x → PairingHeap.occ y h = PairingHeap.occ y result) ∧ PairingHeap.size result = PairingHeap.size h + (1 : ℤ)
  := sorry
end pairing_heap_Correct_insertqtrefnqtvc
