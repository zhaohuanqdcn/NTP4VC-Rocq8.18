import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.selection_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.selection_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.selection_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace ForceSorted_Why3_ide_VCForceSorted_post_goal0
theorem goal0 (a : Memory.addr) (i : ℤ) (t : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Cint.is_uint32 i) (fact2 : ∀(i_2 : ℤ) (i_1 : ℤ), i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i_1 → t (Memory.shift a i_2) ≤ t (Memory.shift a i_1)) : Axiomatic1.p_sorted_1' t a (0 : ℤ) i
  := sorry
end ForceSorted_Why3_ide_VCForceSorted_post_goal0
