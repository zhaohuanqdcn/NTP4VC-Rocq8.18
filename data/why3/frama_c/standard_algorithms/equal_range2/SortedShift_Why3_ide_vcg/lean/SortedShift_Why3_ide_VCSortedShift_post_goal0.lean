import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal_range2.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.equal_range2.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace SortedShift_Why3_ide_VCSortedShift_post_goal0
theorem goal0 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Axiomatic.p_sorted_1' t a i_1 i) : Axiomatic.p_sorted_1' t (Memory.shift a i_1) (0 : ℤ) (i - i_1)
  := sorry
end SortedShift_Why3_ide_VCSortedShift_post_goal0
