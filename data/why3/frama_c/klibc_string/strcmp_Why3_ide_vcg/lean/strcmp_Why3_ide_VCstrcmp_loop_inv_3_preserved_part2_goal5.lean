import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcmp_Why3_ide_VCstrcmp_loop_inv_3_preserved_part2_goal5
theorem goal5 (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) : let x : ℤ := t_1 a_2; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := Memory.addr.offset a_2; let x_3 : ℤ := Memory.addr.offset a_1; let a_3 : Memory.addr := Memory.shift a (x_2 - x_3); let x_5 : ℤ := A_Length.l_length t_1 a_1; let x_6 : ℤ := A_Length.l_length t_1 a; let a_4 : Memory.addr := Memory.shift a x_6; ¬x = (0 : ℤ) → Memory.addr.base a_2 = x_1 → t_1 a_3 = x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region x_1 ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.addr_le a_1 a_2 → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_3 → Memory.addr_le a_2 (Memory.shift a_1 x_5) → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + x_6) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x_5) → Memory.addr_le a a_3 → Memory.addr_le a_3 a_4 → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 + x_3 < x_2 → t_1 (Memory.shift a_1 i_4) = t_1 (Memory.shift a i_4)) → Memory.addr_le (Memory.shift a ((1 : ℤ) + x_2 - x_3)) a_4
  := sorry
end strcmp_Why3_ide_VCstrcmp_loop_inv_3_preserved_part2_goal5
