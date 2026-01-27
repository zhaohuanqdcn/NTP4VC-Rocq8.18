import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.upper_bound.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.upper_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace upper_bound_Why3_ide_VCupper_bound_assert_rte_unsigned_overflow_5_goal10
theorem goal10 (i_1 : ℤ) (i_3 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_1 - i_3; let x_1 : ℤ := i_3 + Int.tdiv x (2 : ℤ); let a_1 : Memory.addr := Memory.shift a x_1; let x_2 : ℤ := t_1 a_1; let x_3 : ℤ := i_3 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x) (2 : ℤ)); i_3 ≤ i_1 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x_2 ≤ i → (0 : ℤ) ≤ x_3 → i_1 ≤ (4294967295 : ℤ) + i_3 → x_3 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_2 → Axiomatic.p_upperbound_1' t_1 a (0 : ℤ) i_3 i → Axiomatic.p_strictlowerbound_1' t_1 a i_1 i_2 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Cint.is_uint32 x_1 → Cint.is_sint32 x_2 → Memory.valid_rd t a_1 (1 : ℤ) → x_1 ≤ (4294967294 : ℤ)
  := sorry
end upper_bound_Why3_ide_VCupper_bound_assert_rte_unsigned_overflow_5_goal10
