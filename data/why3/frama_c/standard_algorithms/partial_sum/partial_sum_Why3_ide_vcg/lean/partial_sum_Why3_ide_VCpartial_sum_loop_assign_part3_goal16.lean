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
namespace partial_sum_Why3_ide_VCpartial_sum_loop_assign_part3_goal16
theorem goal16 (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := t_2 a_3; let a_4 : Memory.addr := Memory.shift a (1 : ℤ); let x_1 : ℤ := i - (1 : ℤ); let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 (Function.update t_2 a_2 x) a_4 x_1; let x_2 : ℤ := i_1 - (1 : ℤ); let a_6 : ℤ := a_5 (Memory.shift a x_2); let a_7 : Memory.addr := Memory.shift a_1 i_1; let a_8 : ℤ := a_5 a_7; let a_9 : Memory.addr := Memory.shift a (Cint.to_uint32 x_2); let a_10 : ℤ := a_5 a_9; let a_11 : ℤ := a_8 + a_10; let a_12 : Memory.addr := Memory.shift a i_1; a_6 = A_AccumulateAxiomatic.l_accumulate_1' a_5 a_1 i_1 (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) < i_1 → i_1 ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_1 ≤ (4294967294 : ℤ) → -(2147483648 : ℤ) ≤ a_11 → a_11 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_3 i → Memory.valid_rd t a_7 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_2 i → Memory.valid_rw t a_12 (1 : ℤ) → ¬Memory.invalid t a_12 (1 : ℤ) → Axiomatic1.p_accumulatebounds_1' t_2 a_1 ((1 : ℤ) + i) (0 : ℤ) → Memory.separated a_3 i a_2 i → Memory.valid_rd t a_9 (1 : ℤ) → Cint.is_sint32 a_8 → Cint.is_sint32 a_6 → Cint.is_sint32 a_10 → Axiomatic.p_unchanged_1' a_5 t_2 a_1 (0 : ℤ) i → Axiomatic1.p_partialsum a_5 a_1 i_1 a → Memory.included a_12 (1 : ℤ) a_4 x_1
  := sorry
end partial_sum_Why3_ide_VCpartial_sum_loop_assign_part3_goal16
