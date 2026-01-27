import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.stack_equal.lib.lean.Compound.Compound
import frama_c.standard_algorithms.stack_equal.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace stack_equal_Why3_ide_VCstack_equal_call_equal_pre_valid_goal6
theorem goal6 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (2 : ℤ); let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a (2 : ℤ); let x_1 : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); x = x_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.valid_rw t a (3 : ℤ) → Memory.valid_rw t a_1 (3 : ℤ) → Cint.is_uint32 x_1 → Cint.is_uint32 x → Axiomatic.p_invariant t t_2 t_1 a → Axiomatic.p_invariant t t_2 t_1 a_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t (Memory.shift (t_2 a_4) (0 : ℤ)) x
  := sorry
end stack_equal_Why3_ide_VCstack_equal_call_equal_pre_valid_goal6
