import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_2_established_part1_goal2
theorem goal2 (i : ℤ) (a : Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : -(128 : ℤ) ≤ i_1) (fact3 : i_1 ≤ (127 : ℤ)) (fact4 : Memory.linked t) (fact5 : Memory.sconst t_1) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_sint32 i_1) (fact8 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Memory.addr_le a a
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_2_established_part1_goal2
