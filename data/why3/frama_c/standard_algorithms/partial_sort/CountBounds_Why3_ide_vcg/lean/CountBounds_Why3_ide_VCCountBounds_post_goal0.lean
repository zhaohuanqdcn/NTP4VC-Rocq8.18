import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace CountBounds_Why3_ide_VCCountBounds_post_goal0
theorem goal0 (t : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) : let x : ℤ := A_Count.l_count_1' t a (0 : ℤ) i i_1; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Cint.is_uint32 i → Cint.is_sint32 i_1 → (∀(i_2 : ℤ), let x_1 : ℤ := A_Count.l_count_1' t a (0 : ℤ) i i_2; Cint.is_sint32 i_2 → x_1 ≤ i ∧ (0 : ℤ) ≤ x_1) → x ≤ i ∧ (0 : ℤ) ≤ x
  := sorry
end CountBounds_Why3_ide_VCCountBounds_post_goal0
