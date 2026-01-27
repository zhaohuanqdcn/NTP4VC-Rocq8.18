import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_copy_Why3_ide_VCrotate_copy_assign_exit_part1_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr := Memory.shift a (i_1 - i_2); i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_1 ≤ (4294967295 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rd t a_2 i_1 → Memory.valid_rw t a_3 i_1 → Memory.separated a_2 i_1 a_3 i_1 → Memory.valid_rd t a_2 i_2 ∧ Memory.valid_rw t a_4 i_2 ∧ ¬Memory.invalid t a_4 i_2 ∧ Memory.separated a_2 i_2 a_4 (1 : ℤ) ∨ Memory.valid_rd t a_2 i_2 ∧ Memory.valid_rw t a_4 i_2 ∧ ¬Memory.invalid t a_4 i_2 ∧ Memory.separated a_2 i_2 a_4 (1 : ℤ) ∧ Axiomatic.p_equalranges_1' (Memory.havoc t_1 t_2 a_4 i_2) t_2 a_1 i_2 a_4 → Memory.included a_4 i_2 a_3 i_1
  := sorry
end rotate_copy_Why3_ide_VCrotate_copy_assign_exit_part1_goal4
