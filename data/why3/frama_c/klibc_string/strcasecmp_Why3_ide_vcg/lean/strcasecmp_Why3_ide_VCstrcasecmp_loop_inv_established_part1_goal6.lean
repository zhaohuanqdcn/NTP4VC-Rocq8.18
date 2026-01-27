import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_established_part1_goal6
theorem goal6 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Axiomatic.p_length_of_str_is t t_1 a i) (fact5 : Axiomatic.p_length_of_str_is t t_1 a i_3) (fact6 : Axiomatic.p_length_of_str_is t t_1 a_1 i_1) (fact7 : Axiomatic.p_length_of_str_is t t_1 a_1 i_2) (fact8 : Memory.separated (Memory.shift a_1 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a_1) (Memory.shift a (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_1 a)) : Memory.addr_le a_1 a_1
  := sorry
end strcasecmp_Why3_ide_VCstrcasecmp_loop_inv_established_part1_goal6
