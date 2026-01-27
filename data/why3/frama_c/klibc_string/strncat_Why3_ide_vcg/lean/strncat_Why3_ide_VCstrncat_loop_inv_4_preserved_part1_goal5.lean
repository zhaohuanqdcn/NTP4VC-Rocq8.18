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
namespace strncat_Why3_ide_VCstrncat_loop_inv_4_preserved_part1_goal5
theorem goal5 (i_1 : ℤ) (i : ℤ) (a_1 : Memory.addr) (t_3 : Memory.addr -> ℤ) (a_2 : Memory.addr) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i_4 : ℤ) : let x_1 : ℤ := i_1 - i; let a_3 : Memory.addr := Memory.shift a_1 x_1; let x_2 : ℤ := t_3 a_3; let x_3 : ℤ := A_Length.l_length t_3 a_2; let x_4 : ℤ := Memory.addr.base a_2; let x_5 : ℤ := t_2 a; let a_4 : Memory.addr := Memory.shift a_2 i_1; let a_5 : Memory.addr := Memory.shift a_2 (i_1 + x_3 - i); let x_6 : ℤ := i_1 + x_3; let x_7 : ℤ := A_Length.l_length t_2 a_2; ¬i = (0 : ℤ) → ¬x_2 = (0 : ℤ) → Memory.havoc t_1 t_2 (Memory.shift a_2 x_3) x_1 = t_3 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i_1 → (0 : ℤ) ≤ i_3 → i_3 < i_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region x_4 ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint8 x_5 → Axiomatic.p_length_of_str_is t t_2 a_2 i_2 → Axiomatic.p_length_of_str_is t t_2 a_2 i_3 → Axiomatic.p_length_of_str_is t t_2 a_2 i_4 → Memory.addr_le a_1 a_3 → Memory.addr_le a_3 (Memory.shift a_1 i_1) → Cint.is_sint8 x_2 → Memory.addr_le a_4 a_5 → Memory.addr_le a_5 (Memory.shift a_2 x_6) → ((∀(i_5 : ℤ), (0 : ℤ) ≤ i_5 → i_5 < x_7 → ¬t_2 (Memory.shift a_2 i_5) = (0 : ℤ)) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → ((∃(i_5 : ℤ), t_2 (Memory.shift a_2 i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < x_7) → x_5 = (0 : ℤ)) → ((∃(i_5 : ℤ), t_2 (Memory.shift a_2 i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < x_7) → x_4 = Memory.addr.base a) → ((∃(i_5 : ℤ), t_2 (Memory.shift a_2 i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < x_7) → Axiomatic1.p_exists_first_occurence_of_char t t_2 a_2 (0 : ℤ) (Memory.addr.offset a - Memory.addr.offset a_2)) → ((∃(i_5 : ℤ), t_2 (Memory.shift a_2 i_5) = (0 : ℤ) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < x_7) → Memory.addr_le a_2 a ∧ Memory.addr_le a (Memory.shift a_2 x_7)) → (∀(i_5 : ℤ), x_3 ≤ i_5 → i_5 + i < x_6 → t_3 (Memory.shift a_2 (i_5 + x_3)) = t_3 (Memory.shift a_1 i_5)) → Memory.addr_le a_4 (Memory.shift a_2 ((1 : ℤ) + i_1 + x_3 - i))
  := sorry
end strncat_Why3_ide_VCstrncat_loop_inv_4_preserved_part1_goal5
