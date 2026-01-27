import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace equal_range_Why3_ide_VCequal_range_assert_rte_unsigned_overflow_9_goal18
theorem goal18 (i_3 : ℤ) (i_4 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_3 - i_4; let x_1 : ℤ := Int.tdiv x (2 : ℤ); let x_2 : ℤ := i_4 + x_1; let a_1 : Memory.addr := Memory.shift a x_2; let x_3 : ℤ := t_1 a_1; let x_4 : ℤ := i_4 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x) (2 : ℤ)); let a_2 : Memory.addr := Memory.shift a i_4; (0 : ℤ) ≤ i_1 → i_3 ≤ i_2 → i_4 ≤ i_3 → (0 : ℤ) ≤ i_4 → i_4 < i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → i_1 ≤ x_1 → x_3 ≤ i → (0 : ℤ) ≤ x_4 → i ≤ x_3 → i_3 ≤ (4294967295 : ℤ) + i_4 → x_1 ≤ (4294967295 : ℤ) → x_4 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_2 → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_4 i → Axiomatic.p_strictlowerbound_1' t_1 a i_3 i_2 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Memory.valid_rd t a_2 x_1 → Axiomatic.p_sorted_1' t_1 a_2 (0 : ℤ) x_1 → Cint.is_uint32 x_2 → Cint.is_sint32 x_3 → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic.p_strictupperbound_1' t_1 a_2 (0 : ℤ) i_1 x_3 → Axiomatic.p_lowerbound_1' t_1 a_2 i_1 x_1 x_3 → i_1 + i_4 ≤ (4294967295 : ℤ)
  := sorry
end equal_range_Why3_ide_VCequal_range_assert_rte_unsigned_overflow_9_goal18
