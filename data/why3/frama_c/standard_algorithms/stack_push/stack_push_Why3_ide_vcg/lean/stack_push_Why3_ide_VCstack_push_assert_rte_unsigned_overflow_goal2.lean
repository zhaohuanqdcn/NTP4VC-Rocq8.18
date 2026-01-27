import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_push.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_push.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_push_Why3_ide_VCstack_push_assert_rte_unsigned_overflow_goal2
theorem goal2 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_full t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → x ≤ (4294967294 : ℤ)
  := sorry
end stack_push_Why3_ide_VCstack_push_assert_rte_unsigned_overflow_goal2
