import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace equal_range_Why3_ide_VCequal_range_loop_term_decrease_goal24
theorem goal24 (i_3 : ℤ) (i_5 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_4 : ℤ) (i_6 : ℤ) (a_1 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (t_2 : Memory.addr -> ℤ) : let x_1 : ℤ := i_3 - i_5; let x_2 : ℤ := i_5 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x_1) (2 : ℤ)); let x_3 : ℤ := i_5 + Int.tdiv x_1 (2 : ℤ); let a_2 : Memory.addr := Memory.shift a x_3; let x_4 : ℤ := t_1 a_2; let x_5 : ℤ := Int.tdiv (i_4 - i_5) (2 : ℤ); let x_6 : ℤ := i_6 + Int.tdiv (i_3 - i_6) (2 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 x_6; i_3 ≤ i_2 → i_5 ≤ i_3 → (0 : ℤ) ≤ i_5 → i_5 < i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_2 → i_3 ≤ (4294967295 : ℤ) + i_5 → x_2 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_uint32 i_6 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_2 → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_5 i → Axiomatic.p_strictlowerbound_1' t_1 a i_3 i_2 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Cint.is_uint32 x_3 → Cint.is_sint32 x_4 → Memory.valid_rd t a_2 (1 : ℤ) → (if x_4 < i then i_4 = i_3 ∧ (1 : ℤ) + i_5 + x_5 = i_6 ∧ i_5 + x_5 ≤ (4294967294 : ℤ) else i_1 = i ∧ i_6 = i_5 ∧ a_1 = a ∧ t_2 = t_1 ∧ x_6 = i_4 ∧ i_1 < t_2 a_3 ∧ Memory.valid_rd t a_3 (1 : ℤ)) → i_4 + i_5 < i_3 + i_6
  := sorry
end equal_range_Why3_ide_VCequal_range_loop_term_decrease_goal24
