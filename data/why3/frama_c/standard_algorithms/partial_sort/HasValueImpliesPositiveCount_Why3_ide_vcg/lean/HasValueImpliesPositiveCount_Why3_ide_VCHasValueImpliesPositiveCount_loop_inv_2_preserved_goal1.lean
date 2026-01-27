import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_loop_inv_2_preserved_goal1
theorem goal1 (i_2 : ℤ) (t : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) : let x : ℤ := (1 : ℤ) + i_2; let x_1 : ℤ := t (Memory.shift a i_2); let x_2 : ℤ := t (Memory.shift a x); i_1 ≤ i → i_2 ≤ i → i_2 < i → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → (2 : ℤ) + i_2 ≤ i → i_1 ≤ x → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 x → Cint.is_sint32 (t (Memory.shift a i_1)) → Cint.is_sint32 x_1 → Cint.is_sint32 x_2 → Axiomatic1.p_hasvalue_1' t a i_1 i x_1 → (∀(i_3 : ℤ), i_1 ≤ i_3 → i_3 < i_2 → (0 : ℤ) < A_Count.l_count_1' t a i_1 i (t (Memory.shift a i_3))) → (∀(i_3 : ℤ), Cint.is_sint32 i_3 → A_Count.l_count_1' t a i_1 x i_3 + A_Count.l_count_1' t a x i i_3 = A_Count.l_count_1' t a i_1 i i_3) → (∀(i_3 : ℤ), let x_3 : ℤ := A_Count.l_count_1' t a i_1 i_2 i_3; Cint.is_sint32 i_3 → (0 : ℤ) ≤ x_3 ∧ i_1 + x_3 ≤ i_2) → (∀(i_3 : ℤ), let x_3 : ℤ := A_Count.l_count_1' t a x i i_3; Cint.is_sint32 i_3 → (0 : ℤ) ≤ x_3 ∧ i_2 + x_3 < i) → Axiomatic1.p_hasvalue_1' t a i_1 i x_2
  := sorry
end HasValueImpliesPositiveCount_Why3_ide_VCHasValueImpliesPositiveCount_loop_inv_2_preserved_goal1
