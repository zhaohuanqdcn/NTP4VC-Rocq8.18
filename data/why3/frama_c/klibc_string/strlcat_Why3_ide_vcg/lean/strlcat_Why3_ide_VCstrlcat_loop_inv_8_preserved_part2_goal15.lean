import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlcat_Why3_ide_VCstrlcat_loop_inv_8_preserved_part2_goal15
theorem goal15 (a_1 : Memory.addr) (i_8 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (a : Memory.addr) (i_6 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (i : ℤ) (i_7 : ℤ) (i_9 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_8; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i_1; let a_5 : Memory.addr := Memory.shift a i_6; let a_6 : ℤ := a_4 a_5; let x : ℤ := A_Length.l_length a_4 a; let x_1 : ℤ := (1 : ℤ) + i_2 + i_3; let x_2 : ℤ := (1 : ℤ) + i_4 + i_5; let a_7 : Memory.addr := Memory.shift a (0 : ℤ); t_2 a_2 = (0 : ℤ) → ¬a_6 = (0 : ℤ) → (0 : ℤ) < i → i_1 ≤ i → i_8 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_6 → i_1 ≤ i_6 → i_7 ≤ i_6 → (0 : ℤ) ≤ i_7 → i_8 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ Cint.to_uint32 ((1 : ℤ) + i_9) → i_6 ≤ x → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_8 → Cint.is_uint32 i_9 → Cint.is_sint32 i_1 → Cint.is_sint32 i_6 → Cint.is_sint32 ((1 : ℤ) + i_6) → Axiomatic.p_length_of_str_is t t_2 a i_3 → Axiomatic.p_length_of_str_is t t_2 a i_5 → Axiomatic.p_length_of_str_is t t_2 a_1 i_2 → Axiomatic.p_length_of_str_is t t_2 a_1 i_4 → Memory.addr_le a a_5 → Memory.addr_le a_1 a_2 → Memory.valid_rw t a_3 x_1 → Memory.valid_rw t a_3 x_2 → Memory.separated a_7 ((1 : ℤ) + i_3) a_3 x_1 → Memory.separated a_7 ((1 : ℤ) + i_5) a_3 x_2 → Memory.addr_le a_2 (Memory.shift a_1 (A_Length.l_length t_2 a_1)) → Cint.is_sint8 a_6 → Memory.addr_le a_5 (Memory.shift a x) → (∀(i_10 : ℤ), (0 : ℤ) ≤ i_10 → i_10 < i_8 → ¬t_2 (Memory.shift a_1 i_10) = (0 : ℤ)) → (∀(i_10 : ℤ), (0 : ℤ) ≤ i_10 → i_10 < i_6 → ¬a_4 (Memory.shift a i_10) = (0 : ℤ)) → ¬a_4 (Memory.shift a i_7) = (0 : ℤ)
  := sorry
end strlcat_Why3_ide_VCstrlcat_loop_inv_8_preserved_part2_goal15
