import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.count.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.count.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.count.lib.lean.Compound.Compound
import frama_c.standard_algorithms.count.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace count_Why3_ide_VCcount_loop_inv_count_preserved_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i_3 : ℤ) (i_4 : ℤ) : let x : ℤ := A_Count.l_count_1' t_1 a (0 : ℤ) i_2 i; let x_1 : ℤ := (1 : ℤ) + i_2; let a_1 : Memory.addr := Memory.shift a i_2; let x_2 : ℤ := t_1 a_1; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x ≤ i_2 → (0 : ℤ) ≤ x → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i → Cint.is_uint32 x_1 → Cint.is_sint32 x_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_uint32 x → (if x_2 = i then (1 : ℤ) + i_3 = i_4 ∧ A_Count.l_count_1' t_1 a (0 : ℤ) i_2 x_2 = i_3 ∧ i_3 ≤ (4294967294 : ℤ) else x = i_4) → A_Count.l_count_1' t_1 a (0 : ℤ) x_1 i = i_4
  := sorry
end count_Why3_ide_VCcount_loop_inv_count_preserved_goal3
