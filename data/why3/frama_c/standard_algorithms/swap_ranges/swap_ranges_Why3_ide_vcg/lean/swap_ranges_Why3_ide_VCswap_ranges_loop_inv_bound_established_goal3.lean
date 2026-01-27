import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.swap_ranges.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace swap_ranges_Why3_ide_VCswap_ranges_loop_inv_bound_established_goal3
theorem goal3 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Memory.separated a_3 i a_2 i → (0 : ℤ) ≤ i
  := sorry
end swap_ranges_Why3_ide_VCswap_ranges_loop_inv_bound_established_goal3
