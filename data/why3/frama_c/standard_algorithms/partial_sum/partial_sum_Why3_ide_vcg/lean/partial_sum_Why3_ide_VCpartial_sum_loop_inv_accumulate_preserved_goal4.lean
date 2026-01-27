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
namespace partial_sum_Why3_ide_VCpartial_sum_loop_inv_accumulate_preserved_goal4
theorem goal4 (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := t_2 a_3; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 (Function.update t_2 a_2 x) (Memory.shift a (1 : ℤ)) (i - (1 : ℤ)); let x_1 : ℤ := i_1 - (1 : ℤ); let a_5 : ℤ := a_4 (Memory.shift a x_1); let a_6 : Memory.addr := Memory.shift a_1 i_1; let a_7 : ℤ := a_4 a_6; let a_8 : Memory.addr := Memory.shift a (Cint.to_uint32 x_1); let a_9 : ℤ := a_4 a_8; let a_10 : ℤ := a_7 + a_9; let x_2 : ℤ := (1 : ℤ) + i_1; let a_11 : Memory.addr := Memory.shift a i_1; let a_12 : ℤ := a_7 + a_5; a_5 = A_AccumulateAxiomatic.l_accumulate_1' a_4 a_1 i_1 (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) < i_1 → i_1 ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_1 ≤ (4294967294 : ℤ) → -(2147483648 : ℤ) ≤ a_10 → a_10 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 x_2 → Cint.is_sint32 x → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_3 i → Memory.valid_rd t a_6 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_2 i → Memory.valid_rw t a_11 (1 : ℤ) → Axiomatic1.p_accumulatebounds_1' t_2 a_1 ((1 : ℤ) + i) (0 : ℤ) → Memory.separated a_3 i a_2 i → Memory.valid_rd t a_8 (1 : ℤ) → Cint.is_sint32 a_7 → Cint.is_sint32 a_5 → Cint.is_sint32 a_9 → Axiomatic.p_unchanged_1' a_4 t_2 a_1 (0 : ℤ) i → Axiomatic1.p_partialsum a_4 a_1 i_1 a → Cint.is_sint32 a_12 → a_12 = A_AccumulateAxiomatic.l_accumulate_1' (Function.update a_4 a_11 a_12) a_1 x_2 (0 : ℤ)
  := sorry
end partial_sum_Why3_ide_VCpartial_sum_loop_inv_accumulate_preserved_goal4
