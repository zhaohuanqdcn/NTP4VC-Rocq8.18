import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_init.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_init.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_init_Why3_ide_VCstack_init_post_empty_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (1 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (2 : ℤ); let a_4 : Memory.addr := Memory.shift a (0 : ℤ); (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_1 (3 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (1 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Memory.valid_rw t a_4 i → Memory.separated a_1 (3 : ℤ) a_4 i → Axiomatic.p_empty (Function.update (Function.update t_1 a_2 i) a_3 (0 : ℤ)) a_1
  := sorry
end stack_init_Why3_ide_VCstack_init_post_empty_goal2
