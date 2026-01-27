import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace __strxspn_Why3_ide_VC__strxspn_loop_inv_9_preserved_goal13
theorem goal13 (a_1 : Memory.addr) (i_1 : ℤ) (t_4 : Memory.addr -> ℤ) (i_6 : ℤ) (a : Memory.addr) (t_3 : ℤ -> ℤ) (i : ℤ) (i_2 : ℤ) (i_4 : ℤ) (i_3 : ℤ) (i_5 : ℤ) (t_1 : ℤ -> ℤ) (t_2 : ℤ -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := t_4 a_2; let x_1 : ℤ := A_Length.l_length t_4 a_1; ¬x = (0 : ℤ) → (0 : ℤ) ≤ i_1 → i_6 ≤ i_1 → (0 : ℤ) ≤ i_6 → i_1 ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t_3 → Memory.sconst t_4 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint8 (t_4 a_1) → Cint.is_sint32 ((1 : ℤ) + i_1) → Axiomatic.p_length_of_str_is t_3 t_4 a i_2 → Axiomatic.p_length_of_str_is t_3 t_4 a i_4 → Axiomatic.p_length_of_str_is t_3 t_4 a_1 i_3 → Axiomatic.p_length_of_str_is t_3 t_4 a_1 i_5 → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → Memory.addr_le a_2 (Memory.shift a_1 x_1) → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_4 a) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x_1) → i = (0 : ℤ) ∨ i = (1 : ℤ) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 ≤ (255 : ℤ) → t_1 i_7 = (0 : ℤ)) → (∀(i_7 : ℤ), let x_2 : ℤ := t_2 i_7; (0 : ℤ) ≤ i_7 → i_7 ≤ (255 : ℤ) → x_2 = (0 : ℤ) ∨ x_2 = (1 : ℤ)) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 ≤ (255 : ℤ) → i_7 < (0 : ℤ) ∨ (256 : ℤ) ≤ i_7 → t_1 i_7 = t i_7) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_1 → ¬t_4 (Memory.shift a_1 i_7) = (0 : ℤ)) → (∀(i_7 : ℤ), (0 : ℤ) ≤ i_7 → i_7 < i_1 → t_2 (t_4 (Memory.shift a_1 i_7)) = (1 : ℤ)) → Function.update t_2 (Cint.to_uint8 x) (1 : ℤ) (t_4 (Memory.shift a_1 i_6)) = (1 : ℤ)
  := sorry
end __strxspn_Why3_ide_VC__strxspn_loop_inv_9_preserved_goal13
