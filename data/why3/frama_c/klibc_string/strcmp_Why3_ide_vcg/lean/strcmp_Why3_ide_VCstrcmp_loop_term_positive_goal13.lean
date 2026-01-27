import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_loop_term_positive_goal13
theorem goal13 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := t_1 a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a; let a_3 : Memory.addr := Memory.shift a_2 (x_2 - x_3); let x_4 : ℤ := A_Length.l_length t_1 a; let x_5 : ℤ := A_Length.l_length t_1 a_2; ¬x = (0 : ℤ) → Memory.addr.base a_1 = x_1 → t_1 a_3 = x → Memory.region x_1 ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a a_1 → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a i_3 → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Axiomatic.p_length_of_str_is t t_1 a_2 i_2 → Memory.addr_le a_1 (Memory.shift a x_4) → Memory.separated (Memory.shift a_2 (0 : ℤ)) ((1 : ℤ) + x_5) (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x_4) → Memory.addr_le a_2 a_3 → Memory.addr_le a_3 (Memory.shift a_2 x_5) → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_3 < x_2 → t_1 (Memory.shift a_2 i_4) = t_1 (Memory.shift a i_4)) → x_2 ≤ x_3 + x_5
  := sorry
end strcmp_Why3_ide_VCstrcmp_loop_term_positive_goal13
