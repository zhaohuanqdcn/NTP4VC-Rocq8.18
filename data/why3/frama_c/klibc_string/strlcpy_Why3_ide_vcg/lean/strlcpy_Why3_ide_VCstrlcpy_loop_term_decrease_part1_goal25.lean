import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_loop_term_decrease_part1_goal25
theorem goal25 (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (a : Memory.addr) (i_3 : ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; let a_5 : Memory.addr := Memory.shift a i_3; let a_6 : ℤ := a_4 a_5; let x : ℤ := Memory.addr.offset a_2; let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := Cint.to_uint32 ((1 : ℤ) + i_3); let x_3 : ℤ := A_Length.l_length a_4 a; let x_4 : ℤ := (2 : ℤ) + i_3; ¬a_6 = (0 : ℤ) → (0 : ℤ) < i → i ≤ i_1 → i ≤ i_2 → (0 : ℤ) ≤ i_3 → x ≤ x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x_2 < Cint.to_uint32 i → x_1 ≤ i + x → i_3 ≤ x_3 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i → Memory.addr_le a_2 a_1 → Axiomatic.p_length_of_str_is t t_2 a i_1 → Axiomatic.p_length_of_str_is t t_2 a i_2 → Memory.addr_le a a_5 → Memory.addr_le a_1 (Memory.shift a_2 i) → Memory.valid_rw t a_3 i → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_2 a) a_3 i → Cint.is_sint8 a_6 → Memory.addr_le a_5 (Memory.shift a x_3) → (x_4 ≤ i → Memory.shift a_2 i_3 = a_1) → (x_4 ≤ i → (∀(i_4 : ℤ), (0 : ℤ) ≤ i_4 → i_4 < i_3 → a_4 (Memory.shift a_2 i_4) = a_4 (Memory.shift a i_4))) → i_3 < x_2
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_loop_term_decrease_part1_goal25
