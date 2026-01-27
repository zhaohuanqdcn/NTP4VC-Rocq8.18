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
namespace HeapMaximum_Why3_ide_VCHeapMaximum_loop_inv_preserved_goal1
theorem goal1 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i) (fact1 : i_1 ≤ i) (fact2 : (0 : ℤ) ≤ i_1) (fact3 : i_1 < i) (fact4 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact5 : i_1 ≤ (4294967294 : ℤ)) (fact6 : Cint.is_uint32 i) (fact7 : Cint.is_uint32 i_1) (fact8 : Axiomatic1.p_isheap t a i) (fact9 : Cint.is_uint32 ((1 : ℤ) + i_1)) (fact10 : ∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i_1 → t (Memory.shift a i_2) ≤ t (Memory.shift a (0 : ℤ))) : -(1 : ℤ) ≤ i_1
  := sorry
end HeapMaximum_Why3_ide_VCHeapMaximum_loop_inv_preserved_goal1
