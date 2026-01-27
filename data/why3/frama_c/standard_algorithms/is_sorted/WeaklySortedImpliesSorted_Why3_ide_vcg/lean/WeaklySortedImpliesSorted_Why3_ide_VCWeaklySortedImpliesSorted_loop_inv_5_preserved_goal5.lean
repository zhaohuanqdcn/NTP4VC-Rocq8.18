import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_5_preserved_goal5
theorem goal5 (t : Memory.addr -> ℤ) (a : Memory.addr) (i_4 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (i_3 : ℤ) : let x : ℤ := t (Memory.shift a i_4); (0 : ℤ) < i_1 → i_2 ≤ i → i_4 ≤ i → i_2 ≤ i_1 → i_2 < i_1 → i_3 < i_4 → i_4 < i → i_1 ≤ i_4 → i_2 ≤ i_4 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_1 ≤ (1 : ℤ) + i_3 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_4 → Cint.is_uint32 (i_1 - (1 : ℤ)) → Axiomatic.p_sorted_1' t a i_2 i_4 → Axiomatic.p_weaklysorted_1' t a i_2 i → (∀(i_5 : ℤ), i_1 ≤ i_5 → i_5 < i_4 → t (Memory.shift a i_5) ≤ x) → t (Memory.shift a i_3) ≤ x
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_5_preserved_goal5
