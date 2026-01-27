import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace __init_stdio_Why3_ide_VC__init_stdio_assign_exit_part2_goal7
theorem goal7 (a_2 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) (t_3 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (a_5 : Memory.addr) (fact0 : Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ)) (fact2 : Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ)) (fact3 : Memory.framed t_3) (fact4 : Memory.linked t) (fact5 : Memory.sconst t_2) (fact6 : Cint.is_sint32 i) (fact7 : Cint.is_sint32 i_1) (fact8 : Memory.valid_rw t a_2 (3 : ℤ)) (fact9 : Memory.valid_rw t a_3 (3 : ℤ)) (fact10 : Memory.valid_rw t a_4 (3 : ℤ)) (fact11 : Cint.is_uint32 (t_1 (Memory.shift a (10 : ℤ)))) (fact12 : Cint.is_uint32 (t_1 (Memory.shift a_1 (10 : ℤ)))) : ¬Cint.is_sint32 (t_1 (Memory.shift a_5 (0 : ℤ)))
  := sorry
end __init_stdio_Why3_ide_VC__init_stdio_assign_exit_part2_goal7
