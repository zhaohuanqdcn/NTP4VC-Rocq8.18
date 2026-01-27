import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.make_heap.lib.lean.Compound.Compound
import frama_c.standard_algorithms.make_heap.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace make_heap_Why3_ide_VCmake_heap_loop_inv_unchanged_established_goal6
theorem goal6 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Cint.is_uint32 i) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic.p_unchanged_1' t_1 t_1 a (2 : ℤ) i
  := sorry
end make_heap_Why3_ide_VCmake_heap_loop_inv_unchanged_established_goal6
