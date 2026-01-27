import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_push.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_push.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_push_Why3_ide_VCstack_push_full_post_unchanged_goal5
theorem goal5 (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_2) (fact2 : Memory.linked t) (fact3 : Axiomatic.p_full t_1 a) (fact4 : Memory.valid_rw t a (3 : ℤ)) (fact5 : Axiomatic.p_invariant t t_2 t_1 a) : Axiomatic.p_unchanged_1' t_1 t_1 (Axiomatic.l_storage t_2 a) (0 : ℤ) (Axiomatic.l_size t_1 a)
  := sorry
end stack_push_Why3_ide_VCstack_push_full_post_unchanged_goal5
