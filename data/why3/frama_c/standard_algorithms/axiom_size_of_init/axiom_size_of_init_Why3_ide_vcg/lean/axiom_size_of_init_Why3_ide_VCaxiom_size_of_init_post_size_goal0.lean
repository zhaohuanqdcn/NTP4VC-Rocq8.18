import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.axiom_size_of_init.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.axiom_size_of_init.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace axiom_size_of_init_Why3_ide_VCaxiom_size_of_init_post_size_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let m : Memory.addr -> ℤ := Function.update (Function.update t_1 (Memory.shift a_1 (2 : ℤ)) i) (Memory.shift a_1 (1 : ℤ)) i_1; let x : ℤ := Axiomatic.l_capacity m a_1; let m_1 : Memory.addr -> Memory.addr := Function.update t_2 (Memory.shift a_1 (0 : ℤ)) a; let a_2 : Memory.addr := Axiomatic.l_storage m_1 a_1; let x_1 : ℤ := Axiomatic.l_size m a_1; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (0 : ℤ) < x → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a_1 (3 : ℤ) → Axiomatic.p_empty m a_1 → Cint.is_uint32 x → Cint.is_uint32 x_1 → Axiomatic.p_invariant t m_1 m a_1 → Memory.valid_rw t a_3 x → Memory.separated a_1 (3 : ℤ) a_3 x → x_1 = (0 : ℤ)
  := sorry
end axiom_size_of_init_Why3_ide_VCaxiom_size_of_init_post_size_goal0
