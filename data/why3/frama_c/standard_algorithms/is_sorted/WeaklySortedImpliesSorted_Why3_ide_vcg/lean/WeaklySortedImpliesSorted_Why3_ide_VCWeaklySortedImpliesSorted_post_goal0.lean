import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_post_goal0
theorem goal0 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i < i_1) (fact1 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Axiomatic.p_weaklysorted_1' t a i_1 i) : Axiomatic.p_sorted_1' t a i_1 i
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_post_goal0
