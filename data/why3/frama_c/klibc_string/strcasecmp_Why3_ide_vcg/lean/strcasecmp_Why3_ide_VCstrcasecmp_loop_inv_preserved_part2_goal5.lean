import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.A_ToUpper.A_ToUpper
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic2.Axiomatic2
open Classical
open Lean4Why3
namespace strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_preserved_part2_goal5
theorem goal5 (a_1 : Memory.addr) (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_4 : ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.offset a_2; let x_2 : ℤ := Memory.addr.offset a_1; let a_3 : Memory.addr := Memory.shift a (x_1 - x_2); let x_4 : ℤ := t_1 a_3; let x_5 : ℤ := t_1 a_2; let x_6 : ℤ := A_Length.l_length t_1 a_1; let x_7 : ℤ := A_Length.l_length t_1 a; let a_4 : Memory.addr := Memory.shift a x_7; let x_8 : ℤ := Cint.to_uint8 x_5; let x_9 : ℤ := (32 : ℤ) + i; let x_10 : ℤ := Cint.to_uint8 x_4; Memory.addr.base a_2 = x → ¬x_4 = (0 : ℤ) → (0 : ℤ) ≤ x_5 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (0 : ℤ) ≤ x_4 → x_5 ≤ (255 : ℤ) → x_4 ≤ (255 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a_1 a_2 → Cint.is_sint8 x_5 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a i_3 → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_4 → Memory.addr_le a_2 (Memory.shift a_1 x_6) → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x_7) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x_6) → Memory.addr_le a a_3 → Memory.addr_le a_3 a_4 → Cint.is_sint8 x_4 → (Axiomatic2.p_is_upper x_8 → x_5 = i) → (Axiomatic2.p_is_lower x_8 → x_5 = x_9) → (¬Axiomatic2.p_is_lower x_8 → ¬Axiomatic2.p_is_upper x_8 → x_5 = i) → (Axiomatic2.p_is_upper x_10 → x_4 = i) → (Axiomatic2.p_is_lower x_10 → x_4 = x_9) → (¬Axiomatic2.p_is_lower x_10 → ¬Axiomatic2.p_is_upper x_10 → x_4 = i) → (∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 + x_2 < x_1 → A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a_1 i_5))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a i_5)))) → Memory.addr_le (Memory.shift a ((1 : ℤ) + x_1 - x_2)) a_4
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_preserved_part2_goal5
