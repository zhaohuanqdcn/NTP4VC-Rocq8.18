import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strchr_Why3_ide_VCstrchr_loop_inv_2_preserved_part1_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) : let x : ℤ := t_1 a; let x_1 : ℤ := Memory.addr.base a_1; let x_2 : ℤ := Cint.to_sint8 i_2; ¬x = (0 : ℤ) → x_1 = Memory.addr.base a → ¬x = x_2 → Memory.region x_1 ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i_2 → Memory.addr_le a_1 a → Cint.is_sint8 x → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_1 → Memory.addr_le a (Memory.shift a_1 (A_Length.l_length t_1 a_1)) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + Memory.addr.offset a_1 < Memory.addr.offset a → ¬t_1 (Memory.shift a_1 i_3) = x_2) → Memory.addr_le a_1 (Memory.shift a (1 : ℤ))
  := sorry
end strchr_Why3_ide_VCstrchr_loop_inv_2_preserved_part1_goal0
