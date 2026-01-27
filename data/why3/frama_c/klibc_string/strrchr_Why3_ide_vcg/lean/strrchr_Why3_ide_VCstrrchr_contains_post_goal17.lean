import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strrchr_Why3_ide_VCstrrchr_contains_post_goal17
theorem goal17 (a_2 : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (a : Memory.addr) (i_3 : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := t_1 (Memory.shift a_2 i_2); let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := Memory.addr.offset a_1; let x_5 : ℤ := A_Length.l_length t_1 a_2; let x_6 : ℤ := t_1 a; let a_3 : Memory.addr := Memory.shift a_2 x_5; let a_4 : Memory.addr := Memory.shift a_2 i_3; let x_7 : ℤ := t_1 a_4; t_1 a_1 = (0 : ℤ) → x = x_1 → x_2 = Cint.to_sint8 i_4 → (0 : ℤ) ≤ i_2 → x_3 ≤ x_4 → i_2 < x_5 → Memory.region x ≤ (0 : ℤ) → x_4 ≤ x_3 + x_5 → -(128 : ℤ) ≤ i_4 → i_4 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_4 → Memory.addr_le a_2 a_1 → Cint.is_sint8 x_6 → Axiomatic.p_length_of_str_is t t_1 a_2 i → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Memory.addr_le a_1 a_3 → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → x_6 = i_4) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (∀(i_5 : ℤ), let x_8 : ℤ := i_5 + x_3; Memory.addr.offset a < x_8 → x_8 < x_4 → ¬t_1 (Memory.shift a_2 i_5) = i_4)) → ((∀(i_5 : ℤ), ¬x_2 = t_1 (Memory.shift a_2 i_5) ∧ (0 : ℤ) ≤ i_5 ∧ i_5 + x_3 < x_4) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) → (x_7 = x_2 → (0 : ℤ) ≤ i_3 → i_3 + x_3 < x_4 → (∀(i_5 : ℤ), ¬x_7 = x_2 ∧ i_3 < i_5 ∧ i_5 + x_3 < x_4) → a_4 = a) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ x_1 = Memory.addr.base a → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a ∨ Memory.addr_le a_2 a ∧ Memory.addr_le a a_3 → (∃(i_5 : ℤ), let a_5 : Memory.addr := Memory.shift a_2 i_5; a_5 = a ∧ x_2 = t_1 a_5 ∧ (0 : ℤ) ≤ i_5 ∧ i_5 < x_5 ∧ (∀(i_6 : ℤ), i_5 < i_6 → i_6 < x_5 → ¬x_2 = t_1 (Memory.shift a_2 i_6)))
  := sorry
end strrchr_Why3_ide_VCstrrchr_contains_post_goal17
