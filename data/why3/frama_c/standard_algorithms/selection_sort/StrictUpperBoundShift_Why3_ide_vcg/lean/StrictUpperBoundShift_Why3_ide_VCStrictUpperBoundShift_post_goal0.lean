import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace StrictUpperBoundShift_Why3_ide_VCStrictUpperBoundShift_post_goal0
theorem goal0 (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (i : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_2 ≤ i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Cint.is_uint32 i_1) (fact3 : Cint.is_uint32 i_2) (fact4 : Cint.is_sint32 i) (fact5 : Axiomatic1.p_strictupperbound_1' t (Memory.shift a i_2) (0 : ℤ) (i_1 - i_2) i) : Axiomatic1.p_strictupperbound_1' t a i_2 i_1 i
  := sorry
end StrictUpperBoundShift_Why3_ide_VCStrictUpperBoundShift_post_goal0
