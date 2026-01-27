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
namespace strncasecmp_Why3_ide_VCstrncasecmp_call_toupper_pre_part1_goal15
theorem goal15 (a_6 : Memory.addr) (a_7 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_2 : ℤ) (i_5 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) : let a_8 : Memory.addr := Memory.shift a_6 (0 : ℤ); let a_9 : Memory.addr := Memory.shift a_7 (0 : ℤ); let x : ℤ := i_1 - i; let a_10 : Memory.addr := Memory.shift a x; let a_11 : Memory.addr := Memory.shift a_1 x; let x_1 : ℤ := t_1 a_11; ¬i = (0 : ℤ) → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i ≤ i_1 → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_length_of_str_is t t_2 a_6 i_2 → Axiomatic.p_length_of_str_is t t_2 a_6 i_5 → Axiomatic.p_length_of_str_is t t_2 a_7 i_3 → Axiomatic.p_length_of_str_is t t_2 a_7 i_4 → Memory.valid_rw t a_8 i_1 → Memory.valid_rw t a_9 i_1 → Memory.separated a_9 i_1 a_8 i_1 → Memory.addr_le a_2 a_10 → Memory.addr_le a_4 a_11 → Memory.addr_le a_10 (Memory.shift a_3 i_1) → Memory.addr_le a_11 (Memory.shift a_5 i_1) → Cint.is_uint8 x_1 → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 + i < i_1 → A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_7 i_6))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_2 (Memory.shift a_6 i_6)))) → (0 : ℤ) ≤ x_1
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_call_toupper_pre_part1_goal15
