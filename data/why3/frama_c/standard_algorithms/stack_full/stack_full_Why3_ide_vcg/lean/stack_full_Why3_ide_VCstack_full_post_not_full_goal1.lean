import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_full.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.stack_full.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace stack_full_Why3_ide_VCstack_full_post_not_full_goal1
theorem goal1 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Axiomatic.l_size t_1 a; let a_1 : Memory.addr := Memory.shift a (1 : ℤ); let x_1 : ℤ := t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Cint.is_uint32 x_1 → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → (¬Axiomatic.p_full t_1 a) = (¬x_1 = x)
  := sorry
end stack_full_Why3_ide_VCstack_full_post_not_full_goal1
