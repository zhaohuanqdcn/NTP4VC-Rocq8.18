import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_4_preserved_goal4
theorem goal4 (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (i_3 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) (fact0 : (0 : ℤ) < i_2) (fact1 : i_1 ≤ i) (fact2 : i_3 ≤ i) (fact3 : i_1 < i_2) (fact4 : i_1 ≤ i_2) (fact5 : i_3 < i) (fact6 : i_1 ≤ i_3) (fact7 : i_2 ≤ i_3) (fact8 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact9 : Cint.is_uint32 i) (fact10 : Cint.is_uint32 i_1) (fact11 : Cint.is_uint32 i_2) (fact12 : Cint.is_uint32 i_3) (fact13 : Cint.is_uint32 (i_2 - (1 : ℤ))) (fact14 : Axiomatic.p_sorted_1' t a i_1 i_3) (fact15 : Axiomatic.p_weaklysorted_1' t a i_1 i) (fact16 : ∀(i_4 : ℤ), i_2 ≤ i_4 → i_4 < i_3 → t (Memory.shift a i_4) ≤ t (Memory.shift a i_3)) : i_2 ≤ (1 : ℤ) + i_3
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_4_preserved_goal4
