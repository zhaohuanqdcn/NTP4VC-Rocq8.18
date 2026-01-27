import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strrchr_Why3_ide_VCstrrchr_loop_inv_4_established_part1_goal4
theorem goal4 (a : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : -(128 : ℤ) ≤ i_2) (fact2 : i_2 ≤ (127 : ℤ)) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) (fact5 : Cint.is_sint32 i_2) (fact6 : Axiomatic.p_length_of_str_is t t_1 a i) (fact7 : Axiomatic.p_length_of_str_is t t_1 a i_1) : Memory.addr_le a a
  := sorry
end strrchr_Why3_ide_VCstrrchr_loop_inv_4_established_part1_goal4
