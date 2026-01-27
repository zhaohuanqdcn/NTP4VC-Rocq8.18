import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.stack_top_wd.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_top_wd.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace stack_top_wd_Why3_ide_VCstack_top_wd_post_equal_goal0
theorem goal0 (t_2 : Memory.addr -> Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Axiomatic.l_top t_2 t_1 a; let x_1 : ℤ := Axiomatic.l_top t_2 t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → ¬Axiomatic.p_empty t_1 a → ¬Axiomatic.p_empty t_1 a_1 → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Cint.is_sint32 x → Cint.is_sint32 x_1 → Axiomatic.p_equal t_2 t_1 t_2 t_1 a_1 a → x_1 = x
  := sorry
end stack_top_wd_Why3_ide_VCstack_top_wd_post_equal_goal0
