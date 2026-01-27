import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strlen_Why3_ide_VCstrlen_loop_inv_2_established_part2_goal4
theorem goal4 (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Memory.sconst t_1) (fact3 : Axiomatic.p_length_of_str_is t t_1 a i) (fact4 : Axiomatic.p_length_of_str_is t t_1 a i_1) : Memory.addr_le a (Memory.shift a (A_Length.l_length t_1 a))
  := sorry
end strlen_Why3_ide_VCstrlen_loop_inv_2_established_part2_goal4
