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
namespace strchr_Why3_ide_VCstrchr_exists_post_3_part1_goal9
theorem goal9 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (a : Memory.addr) (i_3 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := t_1 (Memory.shift a_1 i_2); let x_2 : ℤ := A_Length.l_length t_1 a_1; let x_3 : ℤ := Memory.addr.offset a_1; t_1 a = (0 : ℤ) → x = Memory.addr.base a → ¬x_1 = (0 : ℤ) → x_1 = Cint.to_sint8 i_3 → (0 : ℤ) ≤ i_2 → i_2 < x_2 → Memory.region x ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_3 → i_3 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_3 → Memory.addr_le a_1 a → Cint.is_sint8 (t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ))) → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 x_2) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_3 < Memory.addr.offset a → ¬x_1 = t_1 (Memory.shift a_1 i_4)) → Axiomatic1.p_exists_first_occurence_of_char t t_1 a_1 i_3 (-x_3)
  := sorry
end strchr_Why3_ide_VCstrchr_exists_post_3_part1_goal9
