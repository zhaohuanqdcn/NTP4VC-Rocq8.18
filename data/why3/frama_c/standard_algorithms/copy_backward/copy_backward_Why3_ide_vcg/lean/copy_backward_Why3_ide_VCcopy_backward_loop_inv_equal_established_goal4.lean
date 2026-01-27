import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.copy_backward.lib.lean.Compound.Compound
import frama_c.standard_algorithms.copy_backward.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace copy_backward_Why3_ide_VCcopy_backward_loop_inv_equal_established_goal4
theorem goal4 (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rd t a_2 i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.separated a_2 i (Memory.shift a i) (1 : ℤ) → Axiomatic.p_equalranges_2' t_1 t_1 a_1 i i a
  := sorry
end copy_backward_Why3_ide_VCcopy_backward_loop_inv_equal_established_goal4
