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
namespace strncmp_Why3_ide_VCstrncmp_loop_inv_preserved_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 a_1; let x_1 : ℤ := Cint.to_uint8 x; let x_2 : ℤ := t_1 a_3; let x_3 : ℤ := Memory.addr.offset a_1; let x_4 : ℤ := Memory.addr.offset a_2; let x_5 : ℤ := Memory.addr.offset a; let x_6 : ℤ := Memory.addr.offset a_3; let x_7 : ℤ := x_6 - x_4; let x_8 : ℤ := t_1 (Memory.shift a_2 x_7); let x_9 : ℤ := t_1 (Memory.shift a x_7); let x_10 : ℤ := i + x_3 - x_5; let x_11 : ℤ := A_Strnlen.l_strnlen t_1 a x_10; let x_12 : ℤ := A_Strnlen.l_strnlen t_1 a_2 x_10; ¬i = (0 : ℤ) → ¬x_1 = (0 : ℤ) → Cint.to_uint8 x_2 = x_1 → x_3 + x_4 = x_5 + x_6 → x_8 = x_9 → x_5 + x_11 = x_3 + A_Strnlen.l_strnlen t_1 a_1 i → x_4 + x_12 = x_6 + A_Strnlen.l_strnlen t_1 a_3 i → (0 : ℤ) ≤ i → x_5 ≤ x_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a a_1 → Memory.addr_le a_2 a_3 → Cint.is_sint8 x → Cint.is_sint8 x_2 → A_Strnlen.p_valid_strn t t_1 a_1 i → A_Strnlen.p_valid_strn t t_1 a_3 i → Cint.is_uint64 x_10 → Cint.is_sint8 x_9 → Cint.is_sint8 x_8 → A_Strnlen.p_valid_strn t t_1 a x_10 → A_Strnlen.p_valid_strn t t_1 a_2 x_10 → Memory.addr_le a_1 (Memory.shift a x_11) → Memory.addr_le a_3 (Memory.shift a_2 x_12) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_5 < x_3 → t_1 (Memory.shift a_2 i_1) = t_1 (Memory.shift a i_1)) → (∀(i_1 : ℤ), let x_13 : ℤ := t_1 (Memory.shift a_2 i_1); let x_14 : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) ≤ i_1 → i_1 < x_12 → (Cint.to_uint8 x_13 = Cint.to_uint8 x_14) = (x_13 = x_14)) → x_5 + Cint.to_uint64 (i - (1 : ℤ)) ≤ i + x_3
  := sorry
end strncmp_Why3_ide_VCstrncmp_loop_inv_preserved_goal4
