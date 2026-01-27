import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_assert_rte_unsigned_overflow_3_goal5
theorem goal5 (a_1 : Memory.addr) (i_3 : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_4 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_3; let x : ℤ := i_1 + i_3 - (1 : ℤ); Axiomatic.p_equalranges_1' t_1 t_1 a_2 i_1 a = (¬i_4 = (0 : ℤ)) → (0 : ℤ) < i_1 → i_1 ≤ i_2 → i_1 + i_3 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967295 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2 → Memory.valid_rd t a_2 i_1 → (i < i_2 → Axiomatic.p_equalranges_1' t_1 t_1 (Memory.shift a_1 i) i_1 a) → (i_2 = i → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) x a i_1) → (i < i_2 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 ((1 : ℤ) + i) x a i_1) → i_2 = i ∨ i + i_1 ≤ i_2 → i_3 ≤ (4294967294 : ℤ)
  := sorry
end find_end_Why3_ide_VCfind_end_assert_rte_unsigned_overflow_3_goal5
