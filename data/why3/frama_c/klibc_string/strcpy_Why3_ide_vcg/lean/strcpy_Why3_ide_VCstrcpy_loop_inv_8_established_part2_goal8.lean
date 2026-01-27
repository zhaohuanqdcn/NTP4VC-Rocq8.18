import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace strcpy_Why3_ide_VCstrcpy_loop_inv_8_established_part2_goal8
theorem goal8 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := A_Length.l_length t_1 a; let x_1 : ℤ := (1 : ℤ) + x; ¬a_1 = a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i ≤ (2000 : ℤ) → i_1 ≤ (2000 : ℤ) → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a i_1 → Memory.valid_rw t a_2 x_1 → Memory.separated (Memory.shift a (0 : ℤ)) x_1 a_2 x_1 → Memory.addr_le a_1 (Memory.shift a_1 x)
  := sorry
end strcpy_Why3_ide_VCstrcpy_loop_inv_8_established_part2_goal8
