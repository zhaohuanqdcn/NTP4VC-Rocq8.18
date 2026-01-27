import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace strspn_Why3_ide_VCstrspn_post_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_7 : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_5 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_6 : ℤ) : let x : ℤ := A_Length.l_length t_1 a; let x_1 : ℤ := t_1 (Memory.shift a i); (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_7 → i_7 < i → i ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_3 → Axiomatic.p_length_of_str_is t t_1 a i_5 → Axiomatic.p_length_of_str_is t t_1 a_1 i_2 → Axiomatic.p_length_of_str_is t t_1 a_1 i_4 → Axiomatic.p_length_of_str_is t t_1 a_1 i_6 → Cint.is_sint8 x_1 → ¬Axiomatic1.p_char_in_str t_1 a_1 x_1 → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_1) → (∀(i_8 : ℤ), (0 : ℤ) ≤ i_8 → i_8 < i → Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a i_8))) → Axiomatic1.p_char_in_str t_1 a_1 (t_1 (Memory.shift a i_7))
  := sorry
end strspn_Why3_ide_VCstrspn_post_goal0
