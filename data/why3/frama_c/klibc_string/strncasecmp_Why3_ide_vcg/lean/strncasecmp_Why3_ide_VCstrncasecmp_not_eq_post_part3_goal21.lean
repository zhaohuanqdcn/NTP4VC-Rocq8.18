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
namespace strncasecmp_Why3_ide_VCstrncasecmp_not_eq_post_part3_goal21
theorem goal21 (a : Memory.addr) (i : ℤ) (a_1 : Memory.addr) (a_6 : Memory.addr) (a_7 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_5 : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a_2 : Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) : let a_8 : Memory.addr := Memory.shift a i; let a_9 : Memory.addr := Memory.shift a_1 i; let a_10 : Memory.addr := Memory.shift a_6 (0 : ℤ); let a_11 : Memory.addr := Memory.shift a_7 (0 : ℤ); ¬A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a_7 i_5))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a_6 i_5))) → (0 : ℤ) < i → (0 : ℤ) ≤ i_5 → i_5 < i → Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Axiomatic.p_length_of_str_is t t_1 a_6 i_1 → Axiomatic.p_length_of_str_is t t_1 a_6 i_4 → Axiomatic.p_length_of_str_is t t_1 a_7 i_2 → Axiomatic.p_length_of_str_is t t_1 a_7 i_3 → Memory.addr_le a_2 a_8 → Memory.addr_le a_4 a_9 → Memory.addr_le a_8 (Memory.shift a_3 i) → Memory.addr_le a_9 (Memory.shift a_5 i) → Memory.valid_rw t a_10 i → Memory.valid_rw t a_11 i → Memory.separated a_11 i a_10 i → ¬(∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 < i → A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a_7 i_6))) = A_ToUpper.l_toupper (Cint.to_uint8 (t_1 (Memory.shift a_6 i_6))))
  := sorry
end strncasecmp_Why3_ide_VCstrncasecmp_not_eq_post_part3_goal21
