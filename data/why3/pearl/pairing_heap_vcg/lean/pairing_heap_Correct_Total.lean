import Why3.Base
import pearl.pairing_heap_vcg.lean.pairing_heap.HeapType
import pearl.pairing_heap_vcg.lean.pairing_heap.Size
import pearl.pairing_heap_vcg.lean.pairing_heap.Occ
import pearl.pairing_heap_vcg.lean.pairing_heap.PairingHeap
open Classical
open Lean4Why3
namespace pairing_heap_Correct_Total
axiom Refl (x : HeapType.elt) : PairingHeap.le x x
axiom Trans (x : HeapType.elt) (y : HeapType.elt) (z : HeapType.elt) (fact0 : PairingHeap.le x y) (fact1 : PairingHeap.le y z) : PairingHeap.le x z
theorem Total (x : HeapType.elt) (y : HeapType.elt) : PairingHeap.le x y ∨ PairingHeap.le y x
  := sorry
end pairing_heap_Correct_Total
