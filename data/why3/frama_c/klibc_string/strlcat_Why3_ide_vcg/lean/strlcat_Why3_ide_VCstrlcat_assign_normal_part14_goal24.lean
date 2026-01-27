import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlcat_Why3_ide_VCstrlcat_assign_normal_part14_goal24
theorem goal24 (a_1 : Memory.addr) (i_6 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_6; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := (1 : ℤ) + i_2 + i_3; let x_1 : ℤ := (1 : ℤ) + i_4 + i_5; let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := A_Length.l_length t_1 a_1; t_1 a_2 = (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) < i_1 → i_6 ≤ i → i_6 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_6 → Cint.is_sint32 i_1 → Axiomatic.p_length_of_str_is t t_1 a i_3 → Axiomatic.p_length_of_str_is t t_1 a i_5 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Axiomatic.p_length_of_str_is t t_1 a_1 i_4 → Memory.addr_le a_1 a_2 → ¬Memory.invalid t a_3 i_1 → Memory.valid_rw t a_3 x → Memory.valid_rw t a_3 x_1 → Memory.separated a_4 ((1 : ℤ) + i_3) a_3 x → Memory.separated a_4 ((1 : ℤ) + i_5) a_3 x_1 → Memory.addr_le a_2 (Memory.shift a_1 x_2) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_6 → ¬t_1 (Memory.shift a_1 i_7) = (0 : ℤ)) → i_1 ≤ (1 : ℤ) + A_Length.l_length t_1 a + x_2
  := sorry
end strlcat_Why3_ide_VCstrlcat_assign_normal_part14_goal24
