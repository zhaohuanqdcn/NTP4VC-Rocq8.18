import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.remove_copy.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.remove_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace remove_copy_Why3_ide_VCremove_copy_loop_inv_discard_preserved_goal3
theorem goal3 (t_3 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_5 : ℤ) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (t_2 : Memory.addr -> ℤ) (p : Bool) : let x : ℤ := A_Count.l_count_1' t_3 a_1 (0 : ℤ) i_5 i; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 i_5; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let x_1 : ℤ := i_5 - x; let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_4 i_2; let a_6 : ℤ := a_5 a_3; let a_7 : Memory.addr := Memory.shift a x_1; i_5 ≤ i_2 → i_5 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x ≤ i_5 → (0 : ℤ) ≤ x → i_5 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_sint32 i → Memory.valid_rd t a_2 i_2 → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rw t a_4 i_2 → Memory.separated a_2 i_2 a (1 : ℤ) → Cint.is_uint32 x_1 → Cint.is_sint32 a_6 → ¬Axiomatic.p_hasvalue_1' a_5 a (0 : ℤ) x_1 i → Axiomatic.p_unchanged_1' a_5 t_3 a_1 i_5 i_2 → Axiomatic.p_unchanged_1' a_5 t_3 a x_1 i_2 → Axiomatic1.p_multisetretainrest_1' a_5 t_3 a_1 (0 : ℤ) i_5 a (0 : ℤ) x_1 i → (if a_6 = i then a_5 = t_2 ∧ i_4 + A_Count.l_count_1' t_3 a_1 (0 : ℤ) i_5 (t_2 a_3) = i_5 else p = false ∧ i_3 = i_1 ∧ i_1 + x = i_5 ∧ i_3 + x = i_5 ∧ i_4 + x = (1 : ℤ) + i_5 ∧ Function.update a_5 a_7 a_6 = t_2 ∧ i_5 ≤ (4294967294 : ℤ) + x ∧ Memory.valid_rw t a_7 (1 : ℤ)) → ¬Axiomatic.p_hasvalue_1' t_2 a (0 : ℤ) i_4 i
  := sorry
end remove_copy_Why3_ide_VCremove_copy_loop_inv_discard_preserved_goal3
