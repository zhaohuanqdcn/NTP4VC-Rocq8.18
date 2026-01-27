import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sum.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sum.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sum.lib.lean.A_AccumulateAxiomatic.A_AccumulateAxiomatic
import frama_c.standard_algorithms.partial_sum.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace partial_sum_Why3_ide_VCpartial_sum_loop_inv_unchanged_established_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_2 i → Memory.valid_rw t a_3 (1 : ℤ) → Memory.valid_rw t a_3 i → Axiomatic1.p_accumulatebounds_1' t_1 a_1 ((1 : ℤ) + i) (0 : ℤ) → Memory.separated a_2 i a_3 i → Axiomatic.p_unchanged_1' (Function.update t_1 a_3 (t_1 a_2)) t_1 a_1 (0 : ℤ) i
  := sorry
end partial_sum_Why3_ide_VCpartial_sum_loop_inv_unchanged_established_goal9
