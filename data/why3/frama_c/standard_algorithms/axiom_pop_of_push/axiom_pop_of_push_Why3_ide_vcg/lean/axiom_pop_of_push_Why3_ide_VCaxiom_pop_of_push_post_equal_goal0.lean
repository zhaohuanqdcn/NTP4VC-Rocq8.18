import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.axiom_pop_of_push.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.axiom_pop_of_push.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace axiom_pop_of_push_Why3_ide_VCaxiom_pop_of_push_post_equal_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_1; let m : Memory.addr -> ℤ := Function.update t_1 (Memory.shift (t_2 (Memory.shift a (0 : ℤ))) x) i; let m_1 : Memory.addr -> ℤ := Function.update m a_1 i_1; let x_1 : ℤ := Axiomatic.l_capacity m_1 a; let m_2 : Memory.addr -> ℤ := Function.update m a_1 i_2; let x_2 : ℤ := Axiomatic.l_size m_2 a; let x_3 : ℤ := Axiomatic.l_size t_1 a; let a_2 : Memory.addr := Axiomatic.l_storage t_2 a; x_1 = Axiomatic.l_capacity t_1 a → Axiomatic.l_capacity m_2 a = x_1 → x_2 = x_3 → (1 : ℤ) + x_3 = Axiomatic.l_size m_1 a → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_full t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → ¬Axiomatic.p_empty m_1 a → ¬Axiomatic.p_full m_2 a → Axiomatic.p_unchanged_1' m_1 t_1 a_2 (0 : ℤ) x_3 → Axiomatic.p_invariant t t_2 m_1 a → Axiomatic.p_invariant t t_2 m_2 a → Cint.is_sint32 (Axiomatic.l_top t_2 m_1 a) → Axiomatic.p_unchanged_1' m_2 m_1 a_2 (0 : ℤ) x_2 → Axiomatic.p_equal t_2 m_2 t_2 t_1 a a
  := sorry
end axiom_pop_of_push_Why3_ide_VCaxiom_pop_of_push_post_equal_goal0
