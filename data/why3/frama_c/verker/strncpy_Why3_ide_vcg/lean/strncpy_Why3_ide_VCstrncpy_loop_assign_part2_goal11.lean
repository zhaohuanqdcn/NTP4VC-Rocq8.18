import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
open Classical
open Lean4Why3
namespace strncpy_Why3_ide_VCstrncpy_loop_assign_part2_goal11
theorem goal11 (a_3 : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_3; let x_1 : ℤ := Memory.addr.base a_2; let x_2 : ℤ := Memory.addr.offset a_3; let x_3 : ℤ := i + x_2; let x_4 : ℤ := Memory.addr.offset a; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let x_6 : ℤ := i + x_2 - x_4; let x_7 : ℤ := A_Strnlen.l_strnlen t_2 a_2 x_6; let x_8 : ℤ := (1 : ℤ) + x_7; let x_9 : ℤ := t_2 a_1; ¬x = x_1 → ¬x_3 = x_4 → Memory.havoc t_1 t_3 a_4 x_8 = t_2 → x_2 ≤ x_4 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → x_4 ≤ x_3 → (0 : ℤ) ≤ x_7 → Memory.linked t → Memory.sconst t_3 → Cint.is_uint64 i → Memory.addr_le a_2 a_1 → Memory.addr_le a_3 a → Cint.is_sint8 x_9 → A_Strlen.p_valid_str t t_2 a_1 → A_Strlen.p_valid_str t t_3 a_2 → A_Strnlen.p_valid_strn t t_3 a_2 i → Memory.addr_le a (Memory.shift a_3 i) → Cint.is_uint64 x_6 → Memory.addr_le a_1 (Memory.shift a_2 (A_Strnlen.l_strnlen t_2 a_2 i)) → Memory.valid_rw t a_4 ((1 : ℤ) + A_Strnlen.l_strnlen t_3 a_2 i) → ¬Memory.invalid t a_4 x_8 → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + Memory.addr.offset a_2 < Memory.addr.offset a_1 → t_2 (Memory.shift a_3 i_1) = t_2 (Memory.shift a_2 i_1)) → x_7 ≤ A_Strnlen.l_strnlen (Function.update t_2 a x_9) a_2 (Cint.to_uint64 (i + x_2 - (1 : ℤ) - x_4))
  := sorry
end strncpy_Why3_ide_VCstrncpy_loop_assign_part2_goal11
