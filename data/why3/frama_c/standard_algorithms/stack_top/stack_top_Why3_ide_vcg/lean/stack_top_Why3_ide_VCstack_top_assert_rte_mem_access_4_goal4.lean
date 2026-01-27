import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_top.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_top.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_top_Why3_ide_VCstack_top_assert_rte_mem_access_4_goal4
theorem goal4 (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_empty t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 (t_1 a_1) → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end stack_top_Why3_ide_VCstack_top_assert_rte_mem_access_4_goal4
