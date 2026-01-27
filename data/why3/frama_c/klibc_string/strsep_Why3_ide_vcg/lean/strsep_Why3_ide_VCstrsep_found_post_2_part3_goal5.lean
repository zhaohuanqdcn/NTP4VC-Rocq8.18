import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strsep_Why3_ide_VCstrsep_found_post_2_part3_goal5
theorem goal5 (t_2 : Memory.addr -> Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (i_5 : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_7 : ℤ) (i : ℤ) (i_4 : ℤ) (i_6 : ℤ) : let a_3 : Memory.addr := t_2 a_1; let x : ℤ := A_Length.l_length t_1 a_3; let x_1 : ℤ := t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (-(1 : ℤ))); let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_3 : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_2; let a_5 : Memory.addr := Memory.shift a_3 (0 : ℤ); let x_4 : ℤ := (1 : ℤ) + x; ¬a_3 = a_1 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i_5 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → i_5 < x → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 x_1 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Axiomatic.p_length_of_str_is t t_1 a_2 i_2 → Axiomatic.p_length_of_str_is t t_1 a_2 i_3 → Axiomatic.p_length_of_str_is t t_1 a_2 i_7 → Cint.is_sint8 x_2 → Axiomatic.p_length_of_str_is t t_1 a_3 i → Axiomatic.p_length_of_str_is t t_1 a_3 i_4 → Axiomatic.p_length_of_str_is t t_1 a_3 i_6 → Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_5)) → Memory.separated a_1 (1 : ℤ) a_4 x_3 → Memory.separated a_3 (1 : ℤ) a_4 x_3 → Memory.separated a_1 (1 : ℤ) a_5 x_4 → Memory.separated a_5 x_4 a_4 x_3 → Memory.separated a_3 (1 : ℤ) a_5 x_4 → ((∃(i_8 : ℤ), (0 : ℤ) ≤ i_8 ∧ i_8 < x ∧ Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_8))) → Memory.addr.base a_3 = (0 : ℤ)) → ((∃(i_8 : ℤ), (0 : ℤ) ≤ i_8 ∧ i_8 < x ∧ Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_8))) → Axiomatic1.p_char_in_str t_1 a_2 x_1) → ((∃(i_8 : ℤ), (0 : ℤ) ≤ i_8 ∧ i_8 < x ∧ Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_8))) → Memory.addr_le a_3 (Memory.addr.mk (0 : ℤ) (0 : ℤ)) ∧ Memory.addr_lt (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (Memory.shift a_3 x)) → ((∃(i_8 : ℤ), (0 : ℤ) ≤ i_8 ∧ i_8 < x ∧ Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_8))) → (∀(i_8 : ℤ), (0 : ℤ) ≤ i_8 → i_8 + Memory.addr.offset a_3 < (0 : ℤ) → ¬Axiomatic1.p_char_in_str t_1 a_2 (t_1 (Memory.shift a_3 i_8)))) → x_2 = (0 : ℤ)
  := sorry
end strsep_Why3_ide_VCstrsep_found_post_2_part3_goal5
