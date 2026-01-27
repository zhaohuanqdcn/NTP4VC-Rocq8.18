import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace strpbrk_Why3_ide_VCstrpbrk_not_exists_post_part1_goal10
theorem goal10 (a : Memory.addr) (i_6 : ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_5 : ℤ) : let a_2 : Memory.addr := Memory.shift a i_6; let x : ℤ := t_1 a_2; let x_1 : ℤ := A_Length.l_length t_1 a; ¬x = (0 : ℤ) → (0 : ℤ) ≤ i_6 → i_6 ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i_6 → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a i_4 → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Axiomatic.p_length_of_str_is t t_1 a_1 i_3 → Axiomatic.p_length_of_str_is t t_1 a_1 i_5 → Cint.is_sint8 x → Axiomatic1.p_char_in_str t_1 a_1 x → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x_1) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_1) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_6 → ¬Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a i_7))) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < x_1 → ¬Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a i_7))) → a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ)
  := sorry
end strpbrk_Why3_ide_VCstrpbrk_not_exists_post_part1_goal10
