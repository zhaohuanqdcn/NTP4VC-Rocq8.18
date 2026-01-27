import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace equal_range_Why3_ide_VCequal_range_loop_inv_left_preserved_goal6
theorem goal6 (i_2 : ℤ) (i_3 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := i_2 - i_3; let x_1 : ℤ := i_3 + Cint.to_uint32 (Int.tdiv (Cint.to_uint32 x) (2 : ℤ)); let x_2 : ℤ := Int.tdiv x (2 : ℤ); let x_3 : ℤ := i_3 + x_2; let a_1 : Memory.addr := Memory.shift a x_3; let x_4 : ℤ := t_1 a_1; let x_5 : ℤ := (1 : ℤ) + i_3 + x_2; i_2 ≤ i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → x_4 < i → i_2 ≤ (4294967295 : ℤ) + i_3 → x_3 ≤ (4294967294 : ℤ) → x_1 ≤ (4294967295 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1 → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_3 i → Axiomatic.p_strictlowerbound_1' t_1 a i_2 i_1 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Cint.is_uint32 x_3 → Cint.is_uint32 x_5 → Cint.is_sint32 x_4 → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) x_5 i
  := sorry
end equal_range_Why3_ide_VCequal_range_loop_inv_left_preserved_goal6
