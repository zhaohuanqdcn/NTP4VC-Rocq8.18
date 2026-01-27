import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_copy_Why3_ide_VCreplace_copy_loop_assign_part3_goal11
theorem goal11 (a_1 : Memory.addr) (i_2 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 i_2; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a i_2; let a_6 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_4 i_1; let a_7 : ℤ := a_6 a_3; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rd t a_2 i_1 → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rw t a_4 i_1 → Memory.valid_rw t a_5 (1 : ℤ) → ¬Memory.invalid t a_5 (1 : ℤ) → Memory.separated a_2 i_1 a (1 : ℤ) → Cint.is_sint32 a_7 → Axiomatic.p_unchanged_1' a_6 t_2 a_1 i_2 i_1 → Axiomatic.p_replace_1' a_6 t_2 a_1 i_2 a a_7 i → Memory.included a_5 (1 : ℤ) a_4 i_1
  := sorry
end replace_copy_Why3_ide_VCreplace_copy_loop_assign_part3_goal11
