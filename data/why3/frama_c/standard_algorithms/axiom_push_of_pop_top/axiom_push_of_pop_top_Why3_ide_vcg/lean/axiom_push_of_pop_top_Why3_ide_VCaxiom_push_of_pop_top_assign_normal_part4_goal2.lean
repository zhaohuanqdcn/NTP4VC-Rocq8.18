import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.axiom_push_of_pop_top.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.axiom_push_of_pop_top.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace axiom_push_of_pop_top_Why3_ide_VCaxiom_push_of_pop_top_assign_normal_part4_goal2
theorem goal2 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let m : Memory.addr -> ℤ := Function.update t_1 a_1 i; let x : ℤ := Axiomatic.l_capacity m a; let x_1 : ℤ := Axiomatic.l_size m a; let x_2 : ℤ := (1 : ℤ) + x_1; let a_2 : Memory.addr := Memory.shift (t_2 (Memory.shift a (0 : ℤ))) i; let m_1 : Memory.addr -> ℤ := Function.update (Function.update m a_2 i_1) a_1 i_2; let x_3 : ℤ := Axiomatic.l_top t_2 m_1 a; let x_4 : ℤ := t_1 a_1; let a_3 : Memory.addr := Axiomatic.l_storage t_2 a; x = Axiomatic.l_capacity t_1 a → x_2 = Axiomatic.l_size t_1 a → Axiomatic.l_capacity m_1 a = x → x_2 = Axiomatic.l_size m_1 a → x_3 = Axiomatic.l_top t_2 t_1 a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 i → ¬Axiomatic.p_empty t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x_4 → Axiomatic.p_invariant t t_2 t_1 a → ¬Axiomatic.p_full m a → Axiomatic.p_invariant t t_2 m a → ¬Memory.invalid t a_2 (1 : ℤ) → Axiomatic.p_unchanged_1' m t_1 a_3 (0 : ℤ) x_1 → ¬Axiomatic.p_empty m_1 a → Axiomatic.p_unchanged_1' m_1 m a_3 (0 : ℤ) x_1 → Axiomatic.p_invariant t t_2 m_1 a → Cint.is_sint32 x_3 → x_4 = (1 : ℤ) + i ∨ a_2 = a_1
  := sorry
end axiom_push_of_pop_top_Why3_ide_VCaxiom_push_of_pop_top_assign_normal_part4_goal2
