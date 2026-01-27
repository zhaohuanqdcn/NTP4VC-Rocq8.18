import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_assign_part11_goal17
theorem goal17 (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i_2 : ℤ) : let x : ℤ := Memory.addr.base a; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := Memory.addr.offset a_1; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_3 : ℤ := x_2 - x_1; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 x_3; let x_4 : ℤ := A_Length.l_length a_4 a; let x_5 : ℤ := (1 : ℤ) + A_Length.l_length t_2 a; let a_5 : Memory.addr := Memory.shift a_2 x_3; ¬a_2 = a → Memory.addr.base a_1 = x → x_1 ≤ x_2 → Memory.region x ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_2 ≤ x_1 + x_4 → i ≤ (2000 : ℤ) → i_1 ≤ (2000 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint8 i_2 → Memory.addr_le a a_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_2 a i → Axiomatic.p_length_of_str_is t t_2 a i_1 → Cint.is_sint32 x_3 → Memory.valid_rw t a_3 x_5 → Memory.separated (Memory.shift a (0 : ℤ)) x_5 a_3 x_5 → Memory.addr_le a_2 a_5 → ¬Memory.invalid t a_5 (1 : ℤ) → Memory.addr_le a_1 (Memory.shift a x_4) → Memory.addr_le a_5 (Memory.shift a_2 x_4) → (¬a_1 = a → ¬i_2 = (0 : ℤ)) → (¬x_2 = x_1 → ¬i_2 = (0 : ℤ)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_1 < x_2 → a_4 (Memory.shift a_2 i_3) = a_4 (Memory.shift a i_3)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + x_1 < x_2 → ¬a_4 (Memory.shift a i_3) = (0 : ℤ)) → Memory.included a_5 (1 : ℤ) a_3 x_5
  := sorry
end strcpy_Why3_ide_VCstrcpy_assign_part11_goal17
