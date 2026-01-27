import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_loop_inv_17_established_part1_goal25
theorem goal25 (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact3 : Memory.linked t) (fact4 : Memory.sconst t_1) (fact5 : Cint.is_uint32 i) (fact6 : ¬Memory.addr_lt a_1 a) (fact7 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) (fact8 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) i) : Memory.addr_le a_1 (Memory.shift a_1 i)
  := sorry
end memmove_Why3_ide_VCmemmove_loop_inv_17_established_part1_goal25
