import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_top.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_top.lib.lean.Axiomatic.Axiomatic
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_top_Why3_ide_VCstack_top_post_top_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := t_2 a_2; let x_1 : ℤ := x - (1 : ℤ); let x_2 : ℤ := t_1 (Memory.shift a_3 x_1); (0 : ℤ) < x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_empty t_1 a → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x_2 → Memory.valid_rd t (Memory.shift a_3 (Cint.to_uint32 x_1)) (1 : ℤ) → x_2 = Axiomatic.l_top t_2 t_1 a
  := sorry
end stack_top_Why3_ide_VCstack_top_post_top_goal0
