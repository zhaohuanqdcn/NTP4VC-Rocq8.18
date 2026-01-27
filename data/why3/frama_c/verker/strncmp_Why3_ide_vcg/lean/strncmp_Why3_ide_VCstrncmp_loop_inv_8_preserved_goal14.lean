import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_8_preserved_goal14
theorem goal14 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_2; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_3; let x_3 : ℤ := Memory.addr.offset a; let x_4 : ℤ := i_1 + x_3; let x_5 : ℤ := Memory.addr.offset a_2; let x_6 : ℤ := Memory.addr.offset a_1; let x_7 : ℤ := Memory.addr.offset a_3; let x_8 : ℤ := x_7 - x_6; let x_9 : ℤ := t_1 (Memory.shift a_1 x_8); let x_10 : ℤ := t_1 (Memory.shift a x_8); let x_12 : ℤ := i_1 + x_3 - x_5; let x_13 : ℤ := A_Strnlen.l_strnlen t_1 a i_1; let x_14 : ℤ := A_Strnlen.l_strnlen t_1 a_1 i_1; ¬x_1 = (0 : ℤ) → Cint.to_uint8 x_2 = x_1 → ¬x_4 = x_5 → x_6 + x_5 = x_3 + x_7 → x_9 = x_10 → x_5 + A_Strnlen.l_strnlen t_1 a_2 x_12 = x_3 + x_13 → x_7 + A_Strnlen.l_strnlen t_1 a_3 x_12 = x_6 + x_14 → (0 : ℤ) ≤ i → x_3 ≤ x_5 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → x_5 ≤ x_4 → i + Cint.to_uint64 (i_1 + x_3 - (1 : ℤ) - x_5) < i_1 → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i_1 → Memory.addr_le a a_2 → Memory.addr_le a_1 a_3 → Cint.is_sint8 x → Cint.is_sint8 x_2 → A_Strnlen.p_valid_strn t t_1 a i_1 → A_Strnlen.p_valid_strn t t_1 a_1 i_1 → Cint.is_uint64 x_12 → Memory.addr_le a_2 (Memory.shift a x_13) → Memory.addr_le a_3 (Memory.shift a_1 x_14) → Cint.is_sint8 x_10 → Cint.is_sint8 x_9 → A_Strnlen.p_valid_strn t t_1 a_2 x_12 → A_Strnlen.p_valid_strn t t_1 a_3 x_12 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_3 < x_5 → t_1 (Memory.shift a_1 i_2) = t_1 (Memory.shift a i_2)) → (∀(i_2 : ℤ), let x_15 : ℤ := t_1 (Memory.shift a_1 i_2); let x_16 : ℤ := t_1 (Memory.shift a i_2); (0 : ℤ) ≤ i_2 → i_2 < x_14 → (Cint.to_uint8 x_15 = Cint.to_uint8 x_16) = (x_15 = x_16)) → t_1 (Memory.shift a_1 i) = t_1 (Memory.shift a i)
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_8_preserved_goal14
