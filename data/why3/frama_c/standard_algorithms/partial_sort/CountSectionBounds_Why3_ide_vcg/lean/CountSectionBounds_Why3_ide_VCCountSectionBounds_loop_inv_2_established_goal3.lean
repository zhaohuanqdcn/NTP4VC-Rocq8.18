import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionBounds_Why3_ide_VCCountSectionBounds_loop_inv_2_established_goal3
theorem goal3 (t : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) : let x : ℤ := A_Count.l_count_1' t a i_2 i_2 i_1; i_2 ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_sint32 i_1 → x ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ x
  := sorry
end CountSectionBounds_Why3_ide_VCCountSectionBounds_loop_inv_2_established_goal3
