import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace strncat_Why3_ide_VCstrncat_larger_assign_normal_part07_goal20
theorem goal20 (a_2 : Memory.addr) (t_3 : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) (i_5 : ℤ) : let a_3 : Memory.addr := Memory.shift a_2 (A_Length.l_length t_3 a_2); let x : ℤ := i_1 - i; let x_1 : ℤ := A_Length.l_length t_2 a_1; let x_2 : ℤ := Memory.addr.base a_2; let x_3 : ℤ := t_2 a; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_4 : ℤ := i_1 + x_1; let x_5 : ℤ := A_Length.l_length t_2 a_2; Memory.havoc t_1 t_2 a_3 x = t_3 → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → (0 : ℤ) ≤ i_3 → i_3 < i_1 → (0 : ℤ) ≤ i_4 → i_4 < i_1 → x_1 ≤ i_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint8 x_3 → Axiomatic.p_length_of_str_is t t_2 a_1 i_4 → Axiomatic.p_length_of_str_is t t_2 a_2 i_2 → Axiomatic.p_length_of_str_is t t_2 a_2 i_3 → Axiomatic.p_length_of_str_is t t_2 a_2 i_5 → Memory.valid_rw t a_4 x_4 → ¬Memory.invalid t a_3 x → Memory.separated (Memory.shift a_1 (0 : ℤ)) x_4 a_4 i_1 → ((∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 < x_5 → ¬t_2 (Memory.shift a_2 i_6) = (0 : ℤ)) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → ((∃(i_6 : ℤ), t_2 (Memory.shift a_2 i_6) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_6 ∧ i_6 < x_5) → x_3 = (0 : ℤ)) → ((∃(i_6 : ℤ), t_2 (Memory.shift a_2 i_6) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_6 ∧ i_6 < x_5) → x_2 = Memory.addr.base a) → ((∃(i_6 : ℤ), t_2 (Memory.shift a_2 i_6) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_6 ∧ i_6 < x_5) → Axiomatic1.p_exists_first_occurence_of_char t t_2 a_2 (0 : ℤ) (Memory.addr.offset a - Memory.addr.offset a_2)) → ((∃(i_6 : ℤ), t_2 (Memory.shift a_2 i_6) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_6 ∧ i_6 < x_5) → Memory.addr_le a_2 a ∧ Memory.addr_le a (Memory.shift a_2 x_5)) → Memory.included a_3 x (Memory.shift a_2 i_1) (x_1 + x_5 - i_1)
  := sorry
end strncat_Why3_ide_VCstrncat_larger_assign_normal_part07_goal20
