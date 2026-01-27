import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_assert_rte_unsigned_overflow_2_goal7
theorem goal7 (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : i_3 ≤ i) (fact2 : i_2 ≤ i_1) (fact3 : i_1 ≤ i_2) (fact4 : i_3 < i) (fact5 : i_1 ≤ i_3) (fact6 : i_2 ≤ i_3) (fact7 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact8 : Cint.is_uint32 i) (fact9 : Cint.is_uint32 i_1) (fact10 : Cint.is_uint32 i_2) (fact11 : Cint.is_uint32 i_3) (fact12 : Axiomatic.p_sorted_1' t a i_2 i_3) (fact13 : Axiomatic.p_weaklysorted_1' t a i_2 i) (fact14 : ∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 < i_3 → t (Memory.shift a i_4) ≤ t (Memory.shift a i_3)) : i_3 ≤ (4294967294 : ℤ)
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_assert_rte_unsigned_overflow_2_goal7
