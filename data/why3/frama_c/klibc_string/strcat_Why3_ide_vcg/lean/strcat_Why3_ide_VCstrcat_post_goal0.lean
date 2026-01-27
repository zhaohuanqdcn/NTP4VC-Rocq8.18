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
namespace strcat_Why3_ide_VCstrcat_post_goal0
theorem goal0 (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i_7 : ℤ) (i_6 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_5 : ℤ) : let x : ℤ := Memory.addr.base a_2; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_3 ((1 : ℤ) + A_Length.l_length t_2 a_1); let x_1 : ℤ := A_Length.l_length a_4 a_1; let x_2 : ℤ := t_3 a; let x_3 : ℤ := A_Length.l_length t_3 a_1; let x_4 : ℤ := (1 : ℤ) + x_3; let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_5 : ℤ := A_Length.l_length t_3 a_2; let a_6 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬a_1 = a → (0 : ℤ) ≤ i_7 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → i_7 ≤ x_1 → i_6 ≤ (2000 : ℤ) → Memory.linked t → Memory.sconst t_3 → Cint.is_sint8 x_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_3 a_1 i → Axiomatic.p_length_of_str_is t t_3 a_1 i_3 → Axiomatic.p_length_of_str_is t t_3 a_1 i_6 → Axiomatic.p_length_of_str_is t t_3 a_2 i_1 → Axiomatic.p_length_of_str_is t t_3 a_2 i_2 → Axiomatic.p_length_of_str_is t t_3 a_2 i_4 → Memory.valid_rw t a_3 x_4 → Memory.valid_rw t a_5 (x_3 + x_5) → Memory.separated a_6 x_4 a_3 x_4 → Memory.separated a_5 ((1 : ℤ) + x_5) a_6 x_4 → Axiomatic.p_length_of_str_is t a_4 a i_5 → Axiomatic.p_length_of_str_is t a_4 a_1 i_5 → ((∀(i_8 : ℤ), (0 : ℤ) ≤ i_8 → i_8 < x_5 → ¬t_3 (Memory.shift a_2 i_8) = (0 : ℤ)) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → ((∃(i_8 : ℤ), t_3 (Memory.shift a_2 i_8) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_8 ∧ i_8 < x_5) → x_2 = (0 : ℤ)) → ((∃(i_8 : ℤ), t_3 (Memory.shift a_2 i_8) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_8 ∧ i_8 < x_5) → x = Memory.addr.base a) → ((∃(i_8 : ℤ), t_3 (Memory.shift a_2 i_8) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_8 ∧ i_8 < x_5) → Axiomatic1.p_exists_first_occurence_of_char t t_3 a_2 (0 : ℤ) (Memory.addr.offset a - Memory.addr.offset a_2)) → ((∃(i_8 : ℤ), t_3 (Memory.shift a_2 i_8) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_8 ∧ i_8 < x_5) → Memory.addr_le a_2 a ∧ Memory.addr_le a (Memory.shift a_2 x_5)) → (∀(i_8 : ℤ), (0 : ℤ) ≤ i_8 → i_8 ≤ x_1 → a_4 (Memory.shift a_1 i_8) = a_4 (Memory.shift a i_8)) → a_4 (Memory.shift a_2 (i_7 + x_5)) = a_4 (Memory.shift a_1 i_7)
  := sorry
end strcat_Why3_ide_VCstrcat_post_goal0
