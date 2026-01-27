import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.mismatch.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.mismatch.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace mismatch_Why3_ide_VCmismatch_assert_rte_unsigned_overflow_goal6
theorem goal6 (a_1 : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a i_1; let x_1 : ℤ := t_1 a_3; x = x_1 → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x_1 → Cint.is_sint32 x → Axiomatic.p_equalranges_1' t_1 t_1 a_1 i_1 a → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t a_2 (1 : ℤ) → i_1 ≤ (4294967294 : ℤ)
  := sorry
end mismatch_Why3_ide_VCmismatch_assert_rte_unsigned_overflow_goal6
