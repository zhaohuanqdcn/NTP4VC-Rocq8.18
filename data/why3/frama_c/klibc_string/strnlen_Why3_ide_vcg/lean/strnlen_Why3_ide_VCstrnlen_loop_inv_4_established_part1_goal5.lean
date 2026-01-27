import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strnlen_Why3_ide_VCstrnlen_loop_inv_4_established_part1_goal5
theorem goal5 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.sconst t_1) (fact4 : Cint.is_uint32 i) (fact5 : Memory.valid_rw t (Memory.shift a (0 : ℤ)) i) : Memory.addr_le a a
  := sorry
end strnlen_Why3_ide_VCstrnlen_loop_inv_4_established_part1_goal5
