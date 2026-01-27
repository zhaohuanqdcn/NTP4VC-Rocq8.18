import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.reverse.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace reverse_Why3_ide_VCreverse_loop_inv_bound_established_goal2
theorem goal2 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Int.tdiv i (2 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 x → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → x ≤ i ∧ (0 : ℤ) ≤ x
  := sorry
end reverse_Why3_ide_VCreverse_loop_inv_bound_established_goal2
