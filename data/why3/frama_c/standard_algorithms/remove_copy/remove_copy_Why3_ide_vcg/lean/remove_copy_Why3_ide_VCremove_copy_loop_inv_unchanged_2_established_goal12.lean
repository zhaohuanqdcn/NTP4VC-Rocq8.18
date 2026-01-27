import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.remove_copy.lib.lean.Compound.Compound
import frama_c.standard_algorithms.remove_copy.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace remove_copy_Why3_ide_VCremove_copy_loop_inv_unchanged_2_established_goal12
theorem goal12 (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rd t a_2 i → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.separated a_2 i a (1 : ℤ) → Axiomatic.p_unchanged_1' t_1 t_1 a (0 : ℤ) i
  := sorry
end remove_copy_Why3_ide_VCremove_copy_loop_inv_unchanged_2_established_goal12
