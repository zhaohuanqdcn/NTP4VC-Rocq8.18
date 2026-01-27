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
namespace partial_sum_Why3_ide_VCpartial_sum_post_partialsum_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (t_3 : Memory.addr -> ℤ) (p : Bool) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Memory.valid_rd t a_2 i_1 → Memory.valid_rw t a_3 i_1 → Axiomatic1.p_accumulatebounds_1' t_3 a_1 ((1 : ℤ) + i_1) (0 : ℤ) → Memory.separated a_2 i_1 a_3 i_1 → (if (0 : ℤ) < i_1 then p = false ∧ i_1 = i ∧ i_2 = i ∧ i_2 = i_1 ∧ t_2 (Memory.shift a (i_3 - (1 : ℤ))) = A_AccumulateAxiomatic.l_accumulate_1' t_2 a_1 i_3 (0 : ℤ) ∧ Memory.havoc t_1 (Function.update t_3 a_3 (t_3 a_2)) (Memory.shift a (1 : ℤ)) (i_1 - (1 : ℤ)) = t_2 ∧ (0 : ℤ) < i_3 ∧ i_3 ≤ i_1 ∧ i_1 ≤ i_3 ∧ Axiomatic.p_unchanged_1' t_2 t_3 a_1 (0 : ℤ) i_1 ∧ Axiomatic1.p_partialsum t_2 a_1 i_3 a ∧ Memory.valid_rd t a_2 (1 : ℤ) ∧ Memory.valid_rw t a_3 (1 : ℤ) else t_3 = t_2) → Axiomatic1.p_partialsum t_2 a_1 i_1 a
  := sorry
end partial_sum_Why3_ide_VCpartial_sum_post_partialsum_goal0
