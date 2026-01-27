import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_equal.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_equal.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_equal_Why3_ide_VCstack_equal_assert_rte_mem_access_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (2 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Cint.is_uint32 (t_1 (Memory.shift a (2 : ℤ))) → Cint.is_uint32 (t_1 a_2) → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Memory.valid_rd t a_2 (1 : ℤ)
  := sorry
end stack_equal_Why3_ide_VCstack_equal_assert_rte_mem_access_goal2
