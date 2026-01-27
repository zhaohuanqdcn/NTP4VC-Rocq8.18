import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_pop.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_pop.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_pop_Why3_ide_VCstack_pop_empty_post_unchanged_goal4
theorem goal4 (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_2) (fact2 : Memory.linked t) (fact3 : Axiomatic.p_empty t_1 a) (fact4 : Memory.valid_rw t a (3 : ℤ)) (fact5 : Axiomatic.p_invariant t t_2 t_1 a) : Axiomatic.p_unchanged_1' t_1 t_1 (Axiomatic.l_storage t_2 a) (0 : ℤ) (Axiomatic.l_size t_1 a)
  := sorry
end stack_pop_Why3_ide_VCstack_pop_empty_post_unchanged_goal4
