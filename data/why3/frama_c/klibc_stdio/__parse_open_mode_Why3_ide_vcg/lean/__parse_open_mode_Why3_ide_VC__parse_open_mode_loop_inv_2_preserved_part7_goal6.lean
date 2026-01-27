import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.A_Length.A_Length
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace __parse_open_mode_Why3_ide_VC__parse_open_mode_loop_inv_2_preserved_part7_goal6
theorem goal6 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; ¬x = (0 : ℤ) → ¬x = (43 : ℤ) → ¬x = (97 : ℤ) → ¬x = (101 : ℤ) → ¬x = (114 : ℤ) → ¬x = (119 : ℤ) → ¬x = (120 : ℤ) → x_1 = Memory.addr.base a → (0 : ℤ) ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → i_2 + x_2 ≤ x_3 → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 (A_Length.l_length t_1 a_1)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_2 < x_3 → ¬t_1 (Memory.shift a_1 i_3) = (0 : ℤ)) → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ)
  := sorry
end __parse_open_mode_Why3_ide_VC__parse_open_mode_loop_inv_2_preserved_part7_goal6
