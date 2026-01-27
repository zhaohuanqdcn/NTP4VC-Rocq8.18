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
namespace strcat_Why3_ide_VCstrcat_assign_normal_part3_goal2
theorem goal2 (a_2 : Memory.addr) (t_3 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i_6 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_5 : ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := t_3 a; let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x_2 : ℤ := A_Length.l_length t_3 a_1; let x_3 : ℤ := (1 : ℤ) + x_2; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_4 : ℤ := A_Length.l_length t_3 a_2; let x_5 : ℤ := (1 : ℤ) + A_Length.l_length t_2 a_1; let a_5 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_6 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_3 x_5; let a_7 : Memory.addr := Memory.shift a_2 x_4; ¬a_1 = a → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → i_6 ≤ (2000 : ℤ) → Memory.linked t → Memory.sconst t_3 → Cint.is_sint8 x_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_3 a_1 i → Axiomatic.p_length_of_str_is t t_3 a_1 i_3 → Axiomatic.p_length_of_str_is t t_3 a_1 i_6 → Axiomatic.p_length_of_str_is t t_3 a_2 i_1 → Axiomatic.p_length_of_str_is t t_3 a_2 i_2 → Axiomatic.p_length_of_str_is t t_3 a_2 i_4 → Memory.valid_rw t a_3 x_3 → Memory.valid_rw t a_4 (x_2 + x_4) → ¬Memory.invalid t a_3 x_5 → Memory.separated a_5 x_3 a_3 x_3 → Memory.separated a_4 ((1 : ℤ) + x_4) a_5 x_3 → Axiomatic.p_length_of_str_is t a_6 a i_5 → Axiomatic.p_length_of_str_is t a_6 a_1 i_5 → ((∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < x_4 → ¬t_3 (Memory.shift a_2 i_7) = (0 : ℤ)) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → ((∃(i_7 : ℤ), t_3 (Memory.shift a_2 i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < x_4) → x_1 = (0 : ℤ)) → ((∃(i_7 : ℤ), t_3 (Memory.shift a_2 i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < x_4) → x = Memory.addr.base a) → ((∃(i_7 : ℤ), t_3 (Memory.shift a_2 i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < x_4) → Axiomatic1.p_exists_first_occurence_of_char t t_3 a_2 (0 : ℤ) (Memory.addr.offset a - Memory.addr.offset a_2)) → ((∃(i_7 : ℤ), t_3 (Memory.shift a_2 i_7) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_7 ∧ i_7 < x_4) → Memory.addr_le a_2 a ∧ Memory.addr_le a a_7) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 ≤ A_Length.l_length a_6 a_1 → a_6 (Memory.shift a_1 i_7) = a_6 (Memory.shift a i_7)) → Memory.included a_3 x_5 a_7 x_3
  := sorry
end strcat_Why3_ide_VCstrcat_assign_normal_part3_goal2
