import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_loop_inv_4_preserved_part2_goal3
theorem goal3 (a : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) : let x : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := Memory.addr.offset a; let x_4 : ℤ := x_1 - x_2; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 x_4; let a_5 : ℤ := a_4 a_1; let x_5 : ℤ := A_Length.l_length a_4 a; let x_6 : ℤ := (1 : ℤ) + A_Length.l_length t_2 a; let a_6 : Memory.addr := Memory.shift a_2 x_4; ¬a_2 = a → Memory.addr.base a_1 = x → ¬a_5 = (0 : ℤ) → x_2 ≤ x_1 → Memory.region x ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_1 ≤ x_2 + x_5 → i ≤ (2000 : ℤ) → i_1 ≤ (2000 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 i_2 → Memory.addr_le a a_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_2 a i → Axiomatic.p_length_of_str_is t t_2 a i_1 → Cint.is_sint32 x_4 → Cint.is_sint32 ((1 : ℤ) + x_1 - x_2) → Memory.valid_rw t a_3 x_6 → Memory.separated (Memory.shift a (0 : ℤ)) x_6 a_3 x_6 → Memory.addr_le a_2 a_6 → Cint.is_sint8 a_5 → Memory.addr_le a_1 (Memory.shift a x_5) → Memory.addr_le a_6 (Memory.shift a_2 x_5) → (¬a_1 = a → ¬i_2 = (0 : ℤ)) → (¬x_1 = x_2 → ¬i_2 = (0 : ℤ)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_2 < x_1 → a_4 (Memory.shift a_2 i_3) = a_4 (Memory.shift a i_3)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_2 < x_1 → ¬a_4 (Memory.shift a i_3) = (0 : ℤ)) → x_1 < x_2 + A_Length.l_length (Function.update a_4 a_6 a_5) a
  := sorry
end strcpy_Why3_ide_VCstrcpy_loop_inv_4_preserved_part2_goal3
