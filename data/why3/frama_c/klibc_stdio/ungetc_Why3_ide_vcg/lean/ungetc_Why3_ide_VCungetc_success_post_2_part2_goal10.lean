import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_stdio.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Axiomatic3.Axiomatic3
open Classical
open Lean4Why3
namespace ungetc_Why3_ide_VCungetc_success_post_2_part2_goal10
theorem goal10 (a_2 : Memory.addr) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_4 : Memory.addr) (a_9 : Memory.addr) (i : ℤ) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_5 : Memory.addr) (a_6 : Memory.addr) (a_8 : Memory.addr) (a_7 : Memory.addr) (fact0 : Memory.shift a_2 (0 : ℤ) = Memory.shift a (0 : ℤ)) (fact1 : t_1 (Memory.shift a_4 (8 : ℤ)) = (0 : ℤ)) (fact2 : t_1 (Memory.shift a_9 (8 : ℤ)) = (0 : ℤ)) (fact3 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact4 : -(128 : ℤ) ≤ i) (fact5 : i ≤ (127 : ℤ)) (fact6 : Memory.framed t_3) (fact7 : Memory.linked t) (fact8 : Memory.sconst t_2) (fact9 : Cint.is_sint32 i) (fact10 : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_1) (fact11 : Axiomatic3.p_valid_io_file_pvt t t_3 t_1 a_3) (fact12 : ¬Memory.addr_le (t_3 (Memory.shift a_5 (6 : ℤ))) (t_3 (Memory.shift a_6 (5 : ℤ)))) (fact13 : Memory.addr_le (t_3 (Memory.shift a_9 (6 : ℤ))) (t_3 (Memory.shift a_9 (5 : ℤ)))) : t_3 (Memory.shift a_8 (6 : ℤ)) = Memory.shift (t_3 (Memory.shift a_7 (6 : ℤ))) (-(1 : ℤ))
  := sorry
end ungetc_Why3_ide_VCungetc_success_post_2_part2_goal10
