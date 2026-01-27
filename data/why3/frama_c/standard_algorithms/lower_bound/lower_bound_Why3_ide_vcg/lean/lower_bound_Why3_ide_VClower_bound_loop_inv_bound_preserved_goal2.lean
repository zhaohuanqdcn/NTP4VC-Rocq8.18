import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.lower_bound.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.lower_bound.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace lower_bound_Why3_ide_VClower_bound_loop_inv_bound_preserved_goal2
theorem goal2 (i_1 : ℤ) (i_4 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i_5 : ℤ) (i : ℤ) : let x_1 : ℤ := i_1 - i_4; let x_2 : ℤ := i_4 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x_1) (2 : ℤ)); let x_3 : ℤ := i_4 + Int.tdiv x_1 (2 : ℤ); let a_1 : Memory.addr := Memory.shift a x_3; let x_4 : ℤ := t_1 a_1; let x_5 : ℤ := Int.tdiv (i_2 - i_4) (2 : ℤ); i_4 ≤ i_1 → i_1 ≤ i_3 → (0 : ℤ) ≤ i_4 → i_4 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_2 → i_1 ≤ (4294967295 : ℤ) + i_4 → x_2 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_3 → Axiomatic.p_lowerbound_1' t_1 a i_1 i_3 i → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_4 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_3 → Cint.is_uint32 x_3 → Cint.is_sint32 x_4 → Memory.valid_rd t a_1 (1 : ℤ) → (if x_4 < i then i_2 = i_1 ∧ (1 : ℤ) + i_4 + x_5 = i_5 ∧ i_4 + x_5 ≤ (4294967294 : ℤ) else i_5 = i_4 ∧ i_5 + Int.tdiv (i_1 - i_5) (2 : ℤ) = i_2) → i_5 ≤ i_2 ∧ i_2 ≤ i_3 ∧ (0 : ℤ) ≤ i_5
  := sorry
end lower_bound_Why3_ide_VClower_bound_loop_inv_bound_preserved_goal2
