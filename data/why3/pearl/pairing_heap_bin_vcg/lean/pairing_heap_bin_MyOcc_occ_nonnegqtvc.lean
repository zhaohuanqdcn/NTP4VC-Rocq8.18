import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Occ
open Classical
open Lean4Why3
namespace pairing_heap_bin_MyOcc_occ_nonnegqtvc
noncomputable def occ (x : HeapType.elt) (h : HeapType.heap) := match h with | HeapType.heap.E => (0 : ℤ) | HeapType.heap.T e r => (if x = e then (1 : ℤ) else (0 : ℤ)) + Occ.occ x r
theorem occ_nonneg'vc (x : HeapType.elt) (h : HeapType.heap) : (0 : ℤ) ≤ occ x h
  := sorry
end pairing_heap_bin_MyOcc_occ_nonnegqtvc
