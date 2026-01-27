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
namespace StrictUpperBoundForce_Why3_ide_VCStrictUpperBoundForce_post_goal0
theorem goal0 (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a : Memory.addr) (i : ℤ) (t : Memory.addr -> ℤ) (fact0 : i_1 < i_2) (fact1 : i_3 ≤ i_1) (fact2 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact3 : Cint.is_uint32 i_2) (fact4 : Cint.is_uint32 i_3) (fact5 : Cint.is_sint32 i) (fact6 : Axiomatic1.p_strictupperbound_1' t a i_3 i_2 i) : t (Memory.shift a i_1) < i
  := sorry
end StrictUpperBoundForce_Why3_ide_VCStrictUpperBoundForce_post_goal0
