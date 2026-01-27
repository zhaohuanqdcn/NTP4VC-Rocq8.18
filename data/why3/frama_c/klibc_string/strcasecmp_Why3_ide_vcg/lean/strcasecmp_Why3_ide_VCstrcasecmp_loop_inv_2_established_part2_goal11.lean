import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_2_established_part2_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) : let x : ℤ := A_Length.l_length t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Axiomatic.p_length_of_str_is t t_1 a i_1 → Axiomatic.p_length_of_str_is t t_1 a i_2 → Axiomatic.p_length_of_str_is t t_1 a_1 i → Axiomatic.p_length_of_str_is t t_1 a_1 i_3 → Memory.separated (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a) (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + x) → Memory.addr_le a_1 (Memory.shift a_1 x)
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_2_established_part2_goal11
