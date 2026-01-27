import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace __fflush_Why3_ide_VC__fflush_loop_inv_4_established_part1_goal4
theorem goal4 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : t_1 (Memory.shift a (7 : ℤ)) = (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Memory.framed t_2) (fact3 : Memory.linked t) (fact4 : Axiomatic3.p_valid_io_file_pvt t t_2 t_1 a) : Memory.addr.base (t_2 (Memory.shift a (6 : ℤ))) = Memory.addr.base (t_2 (Memory.shift a (5 : ℤ)))
  := sorry
end __fflush_Why3_ide_VC__fflush_loop_inv_4_established_part1_goal4
