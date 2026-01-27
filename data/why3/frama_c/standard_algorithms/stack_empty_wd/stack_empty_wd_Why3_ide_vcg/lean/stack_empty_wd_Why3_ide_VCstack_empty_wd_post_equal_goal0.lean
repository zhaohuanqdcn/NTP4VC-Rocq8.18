import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_empty_wd.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_empty_wd.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_empty_wd_Why3_ide_VCstack_empty_wd_post_equal_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (fact0 : (¬i = (1 : ℤ)) = (i = (0 : ℤ))) (fact1 : (¬i_1 = (1 : ℤ)) = (i_1 = (0 : ℤ))) (fact2 : Axiomatic.p_empty t_1 a = (i_1 = (1 : ℤ))) (fact3 : Axiomatic.p_empty t_1 a_1 = (i = (1 : ℤ))) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact6 : Memory.framed t_2) (fact7 : Memory.linked t) (fact8 : Cint.is_sint32 i) (fact9 : Cint.is_sint32 i_1) (fact10 : Memory.valid_rw t a (3 : ℤ)) (fact11 : Memory.valid_rw t a_1 (3 : ℤ)) (fact12 : Axiomatic.p_invariant t t_2 t_1 a) (fact13 : Axiomatic.p_invariant t t_2 t_1 a_1) (fact14 : Axiomatic.p_equal t_2 t_1 t_2 t_1 a_1 a) : i_1 = i
  := sorry
end stack_empty_wd_Why3_ide_VCstack_empty_wd_post_equal_goal0
