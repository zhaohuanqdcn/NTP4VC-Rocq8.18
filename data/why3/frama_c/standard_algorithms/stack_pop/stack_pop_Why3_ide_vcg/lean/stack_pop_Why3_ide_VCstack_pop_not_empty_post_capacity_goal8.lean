import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_pop.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_pop.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_pop_Why3_ide_VCstack_pop_not_empty_post_capacity_goal8
theorem goal8 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_1; (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_empty t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Axiomatic.l_capacity (Function.update t_1 a_1 (x - (1 : ℤ))) a = Axiomatic.l_capacity t_1 a
  := sorry
end stack_pop_Why3_ide_VCstack_pop_not_empty_post_capacity_goal8
