import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace __strxspn_Why3_ide_VC__strxspn_loop_inv_6_established_goal9
theorem goal9 (t_1 : ℤ -> ℤ) (i_5 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_2 : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (i_3 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 i_5; (0 : ℤ) ≤ i_5 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_5 ≤ (255 : ℤ) → Memory.linked t_2 → Memory.sconst t_3 → Cint.is_sint32 i → Cint.is_sint8 (t_3 a_1) → Axiomatic.p_length_of_str_is t_2 t_3 a i_1 → Axiomatic.p_length_of_str_is t_2 t_3 a i_3 → Axiomatic.p_length_of_str_is t_2 t_3 a_1 i_2 → Axiomatic.p_length_of_str_is t_2 t_3 a_1 i_4 → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_3 a) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_3 a_1) → i = (0 : ℤ) ∨ i = (1 : ℤ) → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 ≤ (255 : ℤ) → t_1 i_6 = (0 : ℤ)) → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 ≤ (255 : ℤ) → i_6 < (0 : ℤ) ∨ (256 : ℤ) ≤ i_6 → t_1 i_6 = t i_6) → x = (0 : ℤ) ∨ x = (1 : ℤ)
  := sorry
end __strxspn_Why3_ide_VC__strxspn_loop_inv_6_established_goal9
