import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strrchr_Why3_ide_VCstrrchr_loop_inv_6_preserved_part2_goal9
theorem goal9 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_3 : ℤ) (a_2 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := Memory.addr.base a; let x_3 : ℤ := Cint.to_sint8 i_3; let x_4 : ℤ := Memory.addr.offset a_1; let x_5 : ℤ := Memory.addr.offset a; let x_6 : ℤ := A_Length.l_length t_1 a_1; let x_7 : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 x_6; let a_4 : Memory.addr := Memory.shift a_1 i_2; let x_8 : ℤ := t_1 a_4; ¬x = (0 : ℤ) → x_1 = x_2 → ¬x = x_3 → x_4 ≤ x_5 → Memory.region x_1 ≤ (0 : ℤ) → x_5 ≤ x_4 + x_6 → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_3 → Memory.addr_le a_1 a → Cint.is_sint8 x → Cint.is_sint8 x_7 → Cint.is_sint8 (t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ))) → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a a_3 → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → x_7 = i_3) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → (∀(i_4 : ℤ), let x_9 : ℤ := i_4 + x_4; Memory.addr.offset a_2 < x_9 → x_9 < x_5 → ¬t_1 (Memory.shift a_1 i_4) = i_3)) → ((∀(i_4 : ℤ), ¬t_1 (Memory.shift a_1 i_4) = x_3 ∧ (0 : ℤ) ≤ i_4 ∧ i_4 + x_4 < x_5) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2) → (x_8 = x_3 → (0 : ℤ) ≤ i_2 → i_2 + x_4 < x_5 → (∀(i_4 : ℤ), ¬x_8 = x_3 ∧ i_2 < i_4 ∧ i_4 + x_4 < x_5) → a_4 = a_2) → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 ∨ Memory.addr.base a_2 = x_2 → Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 ∨ Memory.addr_le a_1 a_2 ∧ Memory.addr_le a_2 a_3 → (∃(i_4 : ℤ), let a_5 : Memory.addr := Memory.shift a_1 i_4; let x_9 : ℤ := t_1 a_5; x_9 = x_3 → (0 : ℤ) ≤ i_4 → i_4 + x_4 ≤ x_5 → (∀(i_5 : ℤ), ¬x_9 = x_3 ∧ i_4 < i_5 ∧ i_5 + x_4 ≤ x_5) → a_5 = a_2)
  := sorry
end strrchr_Why3_ide_VCstrrchr_loop_inv_6_preserved_part2_goal9
