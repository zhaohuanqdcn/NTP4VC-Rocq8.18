import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace partial_sort_Why3_ide_VCpartial_sort_call_make_heap_pre_valid_goal16
theorem goal16 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); (0 : ℤ) < i_1 → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_1 i → Memory.valid_rw t a_1 i_1
  := sorry
end partial_sort_Why3_ide_VCpartial_sort_call_make_heap_pre_valid_goal16
