import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.rotate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.rotate.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace rotate_Why3_ide_VCrotate_assign_exit_part2_goal4
theorem goal4 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (t_2 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_1 i_2; let a_3 : Memory.addr := Memory.shift a i_2; let x : ℤ := i_1 - i_2; (0 : ℤ) < i_2 → i_2 ≤ i_1 → i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (4294967295 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Memory.valid_rw t a_1 i_1 → Memory.valid_rw t a_1 i_2 → Axiomatic.p_reverse_5' a_2 t_3 a (0 : ℤ) i_2 → Memory.valid_rw t a_3 x ∧ ¬Memory.invalid t a_3 x ∨ Memory.valid_rw t a_3 x ∧ ¬Memory.invalid t a_3 x ∧ Axiomatic.p_reverse_5' (Memory.havoc t_2 a_2 a_3 x) a_2 a_3 (0 : ℤ) x → Memory.included a_3 x a_1 i_1
  := sorry
end rotate_Why3_ide_VCrotate_assign_exit_part2_goal4
