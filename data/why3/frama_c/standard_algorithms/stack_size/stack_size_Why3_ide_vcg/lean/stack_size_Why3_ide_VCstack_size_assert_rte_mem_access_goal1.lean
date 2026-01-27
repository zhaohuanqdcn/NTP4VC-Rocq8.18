import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_size.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_size.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_size_Why3_ide_VCstack_size_assert_rte_mem_access_goal1
theorem goal1 (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.framed t_2) (fact2 : Memory.linked t) (fact3 : Memory.valid_rw t a (3 : ℤ)) (fact4 : Axiomatic.p_invariant t t_2 t_1 a) : Memory.valid_rd t (Memory.shift a (2 : ℤ)) (1 : ℤ)
  := sorry
end stack_size_Why3_ide_VCstack_size_assert_rte_mem_access_goal1
