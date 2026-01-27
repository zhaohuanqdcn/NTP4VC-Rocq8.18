import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.is_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_heap.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace is_heap_Why3_ide_VCis_heap_loop_inv_heap_established_goal4
theorem goal4 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_isheap t_1 a (1 : ℤ)
  := sorry
end is_heap_Why3_ide_VCis_heap_loop_inv_heap_established_goal4
