import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.replace_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.replace_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace replace_copy_Why3_ide_VCreplace_copy_loop_assign_part4_goal12
theorem goal12 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (i_3 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 i_2; let a_4 : Memory.addr := Memory.shift a_1 i_3; let a_5 : ℤ := a_3 a_4; let a_6 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_7 : Memory.addr := Memory.shift a i_3; ¬a_5 = i_1 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_3 → i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_3 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rd t a_6 i_2 → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rw t a_2 i_2 → Memory.valid_rw t a_7 (1 : ℤ) → ¬Memory.invalid t a_7 (1 : ℤ) → Memory.separated a_6 i_2 a (1 : ℤ) → Cint.is_sint32 a_5 → Axiomatic.p_unchanged_1' a_3 t_2 a_1 i_3 i_2 → Axiomatic.p_replace_1' a_3 t_2 a_1 i_3 a i_1 i → Memory.included a_7 (1 : ℤ) a_2 i_2
  := sorry
end replace_copy_Why3_ide_VCreplace_copy_loop_assign_part4_goal12
