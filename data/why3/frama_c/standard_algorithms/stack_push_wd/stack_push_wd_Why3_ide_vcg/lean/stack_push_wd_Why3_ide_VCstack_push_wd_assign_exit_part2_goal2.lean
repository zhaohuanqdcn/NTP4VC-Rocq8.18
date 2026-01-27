import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_push_wd.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_push_wd.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_push_wd_Why3_ide_VCstack_push_wd_assign_exit_part2_goal2
theorem goal2 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (2 : ℤ); let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift (t_2 (Memory.shift a_1 (0 : ℤ))) x; let m : Memory.addr -> ℤ := Function.update (Function.update t_1 a_3 i) a_2 i_1; let x_1 : ℤ := Axiomatic.l_size t_1 a_1; let a_4 : Memory.addr := Memory.shift a (2 : ℤ); let x_2 : ℤ := t_1 a_4; let x_3 : ℤ := m a_4; let a_5 : Memory.addr := Memory.shift (t_2 (Memory.shift a (0 : ℤ))) x_3; Axiomatic.l_capacity m a_1 = Axiomatic.l_capacity t_1 a_1 → (1 : ℤ) + x_1 = Axiomatic.l_size m a_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_full t_1 a → ¬Axiomatic.p_full t_1 a_1 → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Cint.is_uint32 x_2 → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Axiomatic.p_separated t_2 t_1 a_1 a → Axiomatic.p_equal t_2 t_1 t_2 t_1 a_1 a → Cint.is_uint32 x_3 → ¬Axiomatic.p_empty m a_1 → Axiomatic.p_unchanged_1' m t_1 (Axiomatic.l_storage t_2 a_1) (0 : ℤ) x_1 → Axiomatic.p_invariant t t_2 m a → Axiomatic.p_invariant t t_2 m a_1 → Cint.is_sint32 (Axiomatic.l_top t_2 m a_1) → ¬Memory.invalid t a_5 (1 : ℤ) → x_3 = x_2 ∨ a_5 = a_4 ∨ a_5 = a_2 ∨ a_5 = a_3
  := sorry
end stack_push_wd_Why3_ide_VCstack_push_wd_assign_exit_part2_goal2
