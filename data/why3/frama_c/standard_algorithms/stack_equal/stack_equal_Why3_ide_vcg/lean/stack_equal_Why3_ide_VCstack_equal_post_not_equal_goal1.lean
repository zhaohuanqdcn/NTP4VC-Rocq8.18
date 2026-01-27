import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_equal.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_equal.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_equal_Why3_ide_VCstack_equal_post_not_equal_goal1
theorem goal1 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (p : Bool) : let a_2 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 (2 : ℤ); let x_1 : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_5 : Memory.addr := t_2 a_4; let a_6 : Memory.addr := Memory.shift a (0 : ℤ); let a_7 : Memory.addr := t_2 a_6; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_sint32 i → Cint.is_sint32 i_1 → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Cint.is_uint32 x → Cint.is_uint32 x_1 → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → (if x_1 = x then p = false ∧ Axiomatic.p_equalranges_1' t_1 t_1 a_5 x_1 a_7 = (¬i_1 = (0 : ℤ)) ∧ Memory.valid_rd t a_6 (1 : ℤ) ∧ Memory.valid_rd t a_4 (1 : ℤ) ∧ Memory.valid_rd t (Memory.shift a_7 (0 : ℤ)) x_1 ∧ Memory.valid_rd t (Memory.shift a_5 (0 : ℤ)) x_1 ∧ (if i_1 = (0 : ℤ) then i = (0 : ℤ) else i = (1 : ℤ)) else i = (0 : ℤ)) → (¬Axiomatic.p_equal t_2 t_1 t_2 t_1 a_1 a) = (i = (0 : ℤ))
  := sorry
end stack_equal_Why3_ide_VCstack_equal_post_not_equal_goal1
