import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.is_sorted.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.is_sorted.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_preserved_goal1
theorem goal1 (i_3 : ℤ) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_3; i_1 ≤ i → i_3 ≤ i → i_2 ≤ i_1 → i_1 ≤ i_2 → i_3 < i → i_1 ≤ i_3 → i_2 ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_3 ≤ (4294967294 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 x → Axiomatic.p_sorted_1' t a i_1 i_3 → Axiomatic.p_weaklysorted_1' t a i_1 i → (∀(i_4 : ℤ), i_2 ≤ i_4 → i_4 < i_3 → t (Memory.shift a i_4) ≤ t (Memory.shift a i_3)) → i_2 ≤ x
  := sorry
end WeaklySortedImpliesSorted_Why3_ide_VCWeaklySortedImpliesSorted_loop_inv_preserved_goal1
