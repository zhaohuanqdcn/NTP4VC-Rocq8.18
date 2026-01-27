import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_size.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_size.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_size_Why3_ide_VCstack_size_post_size_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (2 : ℤ); let x : ℤ := t_1 a_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Memory.valid_rd t a_1 (1 : ℤ) → x = Axiomatic.l_size t_1 a
  := sorry
end stack_size_Why3_ide_VCstack_size_post_size_goal0
