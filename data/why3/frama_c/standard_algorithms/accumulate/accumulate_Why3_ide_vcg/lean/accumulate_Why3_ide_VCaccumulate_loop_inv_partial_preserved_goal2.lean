import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.accumulate.lib.lean.A_AccumulateAxiomatic.A_AccumulateAxiomatic
import Why3.Cint.Cint
import frama_c.standard_algorithms.accumulate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.accumulate.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.accumulate.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace accumulate_Why3_ide_VCaccumulate_loop_inv_partial_preserved_goal2
theorem goal2 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := A_AccumulateAxiomatic.l_accumulate t_1 a i_2 i_1; let a_1 : Memory.addr := Memory.shift a i_2; let x_1 : ℤ := t_1 a_1; let x_2 : ℤ := x_1 + x; let x_3 : ℤ := (1 : ℤ) + i_2; i_2 ≤ i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → Cint.is_uint32 x_3 → Axiomatic1.p_accumulatebounds_1' t_1 a i i_1 → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x → Cint.is_sint32 x_2 → x_2 = A_AccumulateAxiomatic.l_accumulate t_1 a x_3 i_1
  := sorry
end accumulate_Why3_ide_VCaccumulate_loop_inv_partial_preserved_goal2
