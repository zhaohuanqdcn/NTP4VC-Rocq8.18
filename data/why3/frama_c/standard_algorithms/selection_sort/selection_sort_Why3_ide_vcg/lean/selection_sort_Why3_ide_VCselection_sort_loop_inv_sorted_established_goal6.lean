import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace selection_sort_Why3_ide_VCselection_sort_loop_inv_sorted_established_goal6
theorem goal6 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_sint32 (t_1 (Memory.shift a (-(1 : ℤ))))) (fact4 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Axiomatic1.p_sorted_1' t_1 a (0 : ℤ) (0 : ℤ)
  := sorry
end selection_sort_Why3_ide_VCselection_sort_loop_inv_sorted_established_goal6
