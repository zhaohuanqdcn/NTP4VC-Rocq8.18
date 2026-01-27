import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.contiki_list.lib.lean.Compound.Compound
import frama_c.contiki_list.lib.lean.S1_list.S1_list
open Classical
open Lean4Why3
namespace index_of_bounds_weak_Why3_ide_VCindex_of_bounds_weak_call_index_of_pre_part2_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : i_1 ≤ i) (fact1 : (0 : ℤ) ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact4 : Memory.framed t_1) (fact5 : Memory.linked t) (fact6 : Cint.is_sint32 i) (fact7 : Cint.is_sint32 i_1) (fact8 : Memory.valid_rw t (Memory.shift a_1 i_1) (i - i_1)) : (0 : ℤ) ≤ i
  := sorry
end index_of_bounds_weak_Why3_ide_VCindex_of_bounds_weak_call_index_of_pre_part2_goal0
