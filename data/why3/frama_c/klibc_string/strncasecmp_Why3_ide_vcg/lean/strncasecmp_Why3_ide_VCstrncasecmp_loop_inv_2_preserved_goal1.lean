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
namespace strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_2_preserved_goal1
theorem goal1 (i_2 : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (i : ℤ) (i_7 : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_3 : ℤ) (i_6 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) : let x : ℤ := i_2 - i_1; let a_8 : Memory.addr := Memory.shift a_1 x; let x_1 : ℤ := t_1 a_8; let a_9 : Memory.addr := Memory.shift a x; let x_2 : ℤ := t_1 a_9; let a_10 : Memory.addr := Memory.shift a_6 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_7 (0 : ℤ); let x_3 : ℤ := (32 : ℤ) + i; ¬i_1 = (0 : ℤ) → ¬x_1 = (0 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i_1 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_7 → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → i_7 + Cint.to_uint32 (i_1 - (1 : ℤ)) < i_2 → (0 : ℤ) ≤ x_2 → (0 : ℤ) ≤ x_1 → x_2 ≤ (255 : ℤ) → x_1 ≤ (255 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic.p_length_of_str_is t t_2 a_6 i_3 → Axiomatic.p_length_of_str_is t t_2 a_6 i_6 → Axiomatic.p_length_of_str_is t t_2 a_7 i_4 → Axiomatic.p_length_of_str_is t t_2 a_7 i_5 → Memory.valid_rw t a_10 i_2 → Memory.valid_rw t a_11 i_2 → Memory.separated a_11 i_2 a_10 i_2 → Memory.addr_le a_2 a_9 → Memory.addr_le a_4 a_8 → Memory.addr_le a_9 (Memory.shift a_3 i_2) → Memory.addr_le a_8 (Memory.shift a_5 i_2) → Cint.is_uint8 x_2 → Cint.is_uint8 x_1 → (Axiomatic2.p_is_upper x_2 → x_2 = i) → (Axiomatic2.p_is_lower x_2 → x_2 = x_3) → (Axiomatic2.p_is_upper x_1 → x_1 = i) → (Axiomatic2.p_is_lower x_1 → x_1 = x_3) → (¬Axiomatic2.p_is_lower x_2 → ¬Axiomatic2.p_is_upper x_2 → x_2 = i) → (¬Axiomatic2.p_is_lower x_1 → ¬Axiomatic2.p_is_upper x_1 → x_1 = i) → (∀(i_8 : ℤ), (0 : ℤ) ≤ i_8 → i_8 + i_1 < i_2 → A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_7 i_8))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_6 i_8)))) → A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_7 i_7))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_6 i_7)))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_loop_inv_2_preserved_goal1
