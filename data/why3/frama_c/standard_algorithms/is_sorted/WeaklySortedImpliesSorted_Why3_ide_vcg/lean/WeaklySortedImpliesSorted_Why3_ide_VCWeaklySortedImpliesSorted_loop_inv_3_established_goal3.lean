import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_3_established_goal3
theorem goal3 (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_1 ≤ i) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Axiomatic.p_weaklysorted_1' t a i_1 i) : Axiomatic.p_sorted_1' t a i_1 i_1
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_3_established_goal3
