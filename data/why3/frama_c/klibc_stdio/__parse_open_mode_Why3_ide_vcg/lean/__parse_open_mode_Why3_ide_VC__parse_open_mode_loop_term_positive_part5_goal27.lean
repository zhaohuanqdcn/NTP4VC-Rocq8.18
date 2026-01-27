import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace __parse_open_mode_Why3_ide_VC__parse_open_mode_loop_term_positive_part5_goal27
theorem goal27 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := A_Length.l_length t_1 a_1; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; t_1 a = (119 : ℤ) → x = Memory.addr.base a → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 x_1) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x_2 < x_3 → ¬t_1 (Memory.shift a_1 i_2) = (0 : ℤ)) → x_3 ≤ x_2 + x_1
  := sorry
end __parse_open_mode_Why3_ide_VC__parse_open_mode_loop_term_positive_part5_goal27
