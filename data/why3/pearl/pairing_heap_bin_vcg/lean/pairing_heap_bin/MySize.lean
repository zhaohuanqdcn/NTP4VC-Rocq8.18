import Why3.Base
import pearl.pairing_heap_bin_vcg.lean.pairing_heap_bin.HeapType
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace MySize
noncomputable def size (h : HeapType.heap) := match h with | HeapType.heap.E => (0 : ℤ) | HeapType.heap.T _ r => (1 : ℤ) + Size.size r
end MySize
