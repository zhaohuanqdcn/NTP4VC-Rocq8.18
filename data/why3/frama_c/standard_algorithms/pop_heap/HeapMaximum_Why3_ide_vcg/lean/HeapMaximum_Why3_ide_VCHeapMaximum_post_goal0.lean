import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.pop_heap.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.pop_heap.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace HeapMaximum_Why3_ide_VCHeapMaximum_post_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : i_1 ≤ i) (fact2 : (0 : ℤ) ≤ i_1) (fact3 : i ≤ i_1) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_1) (fact7 : Axiomatic.p_isheap t a i) (fact8 : ∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i_1 → t (Memory.shift a i_2) ≤ t (Memory.shift a (0 : ℤ))) : Axiomatic.p_maxelement t a i_1 (0 : ℤ)
  := sorry
end HeapMaximum_Why3_ide_VCHeapMaximum_post_goal0
