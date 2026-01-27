import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import frama_c.standard_algorithms.push_heap.lib.lean.Axiomatic.Axiomatic
import Why3.Memory.Memory
import frama_c.standard_algorithms.push_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace heap_parent_Why3_ide_VCheap_parent_post_parent_goal0
theorem goal0 (i : ℤ) : let x : ℤ := Int.tdiv (i - (1 : ℤ)) (2 : ℤ); (0 : ℤ) < i → Cint.is_uint32 i → Cint.is_uint32 x → x = Axiomatic.l_heapparent i
  := sorry
end heap_parent_Why3_ide_VCheap_parent_post_parent_goal0
