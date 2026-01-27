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
namespace LowerBoundShift_Why3_ide_VCLowerBoundShift_post_goal0
theorem goal0 (i_1 : ℤ) (i_3 : ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (t : Memory.addr -> ℤ) : let x : ℤ := i_1 + i_3; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x ≤ (4294967295 : ℤ) → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Axiomatic1.p_lowerbound_1' t (Memory.shift a i_3) i_2 i_1 i → Axiomatic1.p_lowerbound_1' t a (i_2 + i_3) x i
  := sorry
end LowerBoundShift_Why3_ide_VCLowerBoundShift_post_goal0
