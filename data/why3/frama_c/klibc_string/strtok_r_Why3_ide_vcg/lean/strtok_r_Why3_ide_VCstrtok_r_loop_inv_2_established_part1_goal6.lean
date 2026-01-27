import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strtok_r_Why3_ide_VCstrtok_r_loop_inv_2_established_part1_goal6
theorem goal6 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let a_3 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_1 a; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_2; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t (t_2 a_1) (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a i → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Axiomatic.p_length_of_str_is t t_1 a_2 i_2 → Memory.separated a_1 (1 : ℤ) a_3 x → Memory.separated a_1 (1 : ℤ) a_4 x_1 → Memory.separated a_3 x a_4 x_1 → Memory.addr_le a a
  := sorry
end strtok_r_Why3_ide_VCstrtok_r_loop_inv_2_established_part1_goal6
