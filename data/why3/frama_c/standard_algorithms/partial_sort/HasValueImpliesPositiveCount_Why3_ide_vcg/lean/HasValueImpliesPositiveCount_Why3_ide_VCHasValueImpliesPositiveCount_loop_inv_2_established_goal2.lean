import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_loop_inv_2_established_goal2
theorem goal2 (t : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) : let x : ℤ := t (Memory.shift a i_1); i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Axiomatic1.p_hasvalue_1' t a i_1 i x
  := sorry
end HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_loop_inv_2_established_goal2
