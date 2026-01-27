import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_empty.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_empty.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace stack_empty_Why3_ide_VCstack_empty_post_not_empty_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Axiomatic.l_size t_1 a; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → (¬Axiomatic.p_empty t_1 a) = (¬x = (0 : ℤ))
  := sorry
end stack_empty_Why3_ide_VCstack_empty_post_not_empty_goal1
