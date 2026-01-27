import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace HeapMaximum_Why3_ide_VCHeapMaximum_loop_inv_2_preserved_goal2
theorem goal2 (t : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := t (Memory.shift a (0 : ℤ)); (0 : ℤ) < i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (4294967294 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Axiomatic1.p_isheap t a i → Cint.is_uint32 ((1 : ℤ) + i_1) → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < i_1 → t (Memory.shift a i_3) ≤ x) → t (Memory.shift a i_2) ≤ x
  := sorry
end HeapMaximum_Why3_ide_VCHeapMaximum_loop_inv_2_preserved_goal2
