import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_pop_wd.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_pop_wd.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_pop_wd_Why3_ide_VCstack_pop_wd_call_stack_pop_pre_valid_2_goal2
theorem goal2 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let m : Memory.addr -> ℤ := Function.update t_1 (Memory.shift a_1 (2 : ℤ)) i; let x : ℤ := Axiomatic.l_capacity m a_1; let x_1 : ℤ := Axiomatic.l_capacity t_1 a_1; let x_2 : ℤ := Axiomatic.l_size m a_1; let x_3 : ℤ := Axiomatic.l_size t_1 a_1; let a_2 : Memory.addr := Axiomatic.l_storage t_2 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Axiomatic.p_separated t_2 t_1 a_1 a → Axiomatic.p_equal t_2 t_1 t_2 t_1 a_1 a → Axiomatic.p_invariant t t_2 m a_1 → (Axiomatic.p_full m a_1 → Axiomatic.p_empty t_1 a_1) → (Axiomatic.p_empty t_1 a_1 → Axiomatic.p_empty m a_1) → (Axiomatic.p_empty t_1 a_1 → x = x_1) → (¬Axiomatic.p_empty t_1 a_1 → x = x_1) → (Axiomatic.p_empty t_1 a_1 → x_2 = x_3) → (¬Axiomatic.p_empty t_1 a_1 → (1 : ℤ) + x_2 = x_3) → (Axiomatic.p_empty t_1 a_1 → Axiomatic.p_unchanged_1' m t_1 a_2 (0 : ℤ) x_2) → (¬Axiomatic.p_empty t_1 a_1 → Axiomatic.p_unchanged_1' m t_1 a_2 (0 : ℤ) x_2) → Axiomatic.p_invariant t t_2 m a
  := sorry
end stack_pop_wd_Why3_ide_VCstack_pop_wd_call_stack_pop_pre_valid_2_goal2
