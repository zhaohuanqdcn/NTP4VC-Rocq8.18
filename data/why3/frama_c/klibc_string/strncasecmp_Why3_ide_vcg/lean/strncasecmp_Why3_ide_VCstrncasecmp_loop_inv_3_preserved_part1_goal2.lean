import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
import frama_c.klibc_string.lib.lean.A_ToUpper.A_ToUpper
open Classical
open Lean4Why3
namespace strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_3_preserved_part1_goal2
theorem goal2 (i_2 : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_7 : Memory.addr) (a_8 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_3 : ℤ) (i_6 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) (a_6 : Memory.addr) : let x_1 : ℤ := i_2 - i_1; let a_9 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := t_1 a_9; let a_10 : Memory.addr := Memory.shift a x_1; let x_3 : ℤ := t_1 a_10; let a_11 : Memory.addr := Memory.shift a_7 (0 : ℤ); let a_12 : Memory.addr := Memory.shift a_8 (0 : ℤ); let x_4 : ℤ := (32 : ℤ) + i; ¬i_1 = (0 : ℤ) → ¬x_2 = (0 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i_1 → i_1 ≤ i_2 → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_8) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_3 → (0 : ℤ) ≤ x_2 → x_3 ≤ (255 : ℤ) → x_2 ≤ (255 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic.p_length_of_str_is t t_2 a_7 i_3 → Axiomatic.p_length_of_str_is t t_2 a_7 i_6 → Axiomatic.p_length_of_str_is t t_2 a_8 i_4 → Axiomatic.p_length_of_str_is t t_2 a_8 i_5 → Memory.valid_rw t a_11 i_2 → Memory.valid_rw t a_12 i_2 → Memory.separated a_12 i_2 a_11 i_2 → Memory.addr_le a_2 a_10 → Memory.addr_le a_4 a_9 → Memory.addr_le a_10 (Memory.shift a_3 i_2) → Memory.addr_le a_9 (Memory.shift a_5 i_2) → Cint.is_uint8 x_3 → Cint.is_uint8 x_2 → (Axiomatic2.p_is_upper x_3 → x_3 = i) → (Axiomatic2.p_is_lower x_3 → x_3 = x_4) → (Axiomatic2.p_is_upper x_2 → x_2 = i) → (Axiomatic2.p_is_lower x_2 → x_2 = x_4) → (¬Axiomatic2.p_is_lower x_3 → ¬Axiomatic2.p_is_upper x_3 → x_3 = i) → (¬Axiomatic2.p_is_lower x_2 → ¬Axiomatic2.p_is_upper x_2 → x_2 = i) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 + i_1 < i_2 → A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_8 i_7))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_7 i_7)))) → Memory.addr_le a_6 (Memory.shift a_1 ((1 : ℤ) + i_2 - i_1))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_3_preserved_part1_goal2
