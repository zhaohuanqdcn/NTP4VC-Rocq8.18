import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.axiom_push_of_pop_top.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.axiom_push_of_pop_top.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace axiom_push_of_pop_top_Why3_ide_VCaxiom_push_of_pop_top_assign_exit_part4_goal1
theorem goal1 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let m : Memory.addr -> ℤ := Function.update t_1 a_1 i; let x : ℤ := Axiomatic.l_size m a; let x_1 : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift (t_2 (Memory.shift a (0 : ℤ))) i; Axiomatic.l_capacity m a = Axiomatic.l_capacity t_1 a → (1 : ℤ) + x = Axiomatic.l_size t_1 a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 i → ¬Axiomatic.p_empty t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x_1 → Axiomatic.p_invariant t t_2 t_1 a → Cint.is_sint32 (Axiomatic.l_top t_2 t_1 a) → ¬Axiomatic.p_full m a → Axiomatic.p_invariant t t_2 m a → ¬Memory.invalid t a_2 (1 : ℤ) → Axiomatic.p_unchanged_1' m t_1 (Axiomatic.l_storage t_2 a) (0 : ℤ) x → x_1 = (1 : ℤ) + i ∨ a_2 = a_1
  := sorry
end axiom_push_of_pop_top_Why3_ide_VCaxiom_push_of_pop_top_assign_exit_part4_goal1
