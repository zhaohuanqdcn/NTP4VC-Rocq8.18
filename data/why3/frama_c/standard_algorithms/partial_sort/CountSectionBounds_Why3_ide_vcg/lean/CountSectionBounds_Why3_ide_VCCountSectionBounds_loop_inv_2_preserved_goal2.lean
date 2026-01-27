import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace CountSectionBounds_Why3_ide_VCCountSectionBounds_loop_inv_2_preserved_goal2
theorem goal2 (i_2 : ℤ) (t : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i_3 : ℤ) (i : ℤ) : let x : ℤ := (1 : ℤ) + i_2; let x_1 : ℤ := A_Count.l_count_1' t a i_1 x i_3; i_1 ≤ i → i_2 ≤ i → i_2 < i → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i_3 → Cint.is_uint32 x → (∀(i_4 : ℤ), let x_2 : ℤ := A_Count.l_count_1' t a i_1 i_2 i_4; Cint.is_sint32 i_4 → (0 : ℤ) ≤ x_2 ∧ i_1 + x_2 ≤ i_2) → (0 : ℤ) ≤ x_1 ∧ i_1 + x_1 ≤ x
  := sorry
end CountSectionBounds_Why3_ide_VCCountSectionBounds_loop_inv_2_preserved_goal2
