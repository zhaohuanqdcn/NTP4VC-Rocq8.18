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
namespace strncat_Why3_ide_VCstrncat_loop_inv_3_established_goal4
theorem goal4 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i_3 : ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := t_1 a_1; let x_2 : ℤ := A_Length.l_length t_1 a_2; let a_3 : Memory.addr := Memory.shift a_2 x_2; (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_sint8 x_1 → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Axiomatic.p_length_of_str_is t t_1 a_2 i_2 → Axiomatic.p_length_of_str_is t t_1 a_2 i_3 → ((∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < x_2 → ¬t_1 (Memory.shift a_2 i_4) = (0 : ℤ)) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1) → ((∃(i_4 : ℤ), t_1 (Memory.shift a_2 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < x_2) → x_1 = (0 : ℤ)) → ((∃(i_4 : ℤ), t_1 (Memory.shift a_2 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < x_2) → x = Memory.addr.base a_1) → ((∃(i_4 : ℤ), t_1 (Memory.shift a_2 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < x_2) → Axiomatic1.p_exists_first_occurence_of_char t t_1 a_2 (0 : ℤ) (Memory.addr.offset a_1 - Memory.addr.offset a_2)) → ((∃(i_4 : ℤ), t_1 (Memory.shift a_2 i_4) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < x_2) → Memory.addr_le a_2 a_1 ∧ Memory.addr_le a_1 a_3) → a_3 = a_1
  := sorry
end strncat_Why3_ide_VCstrncat_loop_inv_3_established_goal4
