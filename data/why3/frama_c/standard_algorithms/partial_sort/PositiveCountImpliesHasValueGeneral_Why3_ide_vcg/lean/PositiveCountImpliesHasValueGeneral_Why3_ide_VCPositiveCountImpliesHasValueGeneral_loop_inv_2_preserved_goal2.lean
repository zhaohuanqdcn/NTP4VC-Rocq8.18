import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_loop_inv_2_preserved_goal2
theorem goal2 (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (i_3 : ℤ) (t : Memory.addr -> ℤ) : let x : ℤ := (1 : ℤ) + i_2; i_2 ≤ i → i_1 < i → i_2 < i → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i_3 → Cint.is_uint32 x → (∀(i_4 : ℤ), i_1 ≤ i_4 → i_4 ≤ i_2 → ¬t (Memory.shift a i_4) = i_3) → (∀(i_4 : ℤ), Cint.is_sint32 i_4 → (∀(i_5 : ℤ), i_1 ≤ i_5 → i_5 < i_2 → ¬t (Memory.shift a i_5) = i_4) → A_Count.l_count_1' t a i_1 i_2 i_4 = (0 : ℤ)) → A_Count.l_count_1' t a i_1 x i_3 = (0 : ℤ)
  := sorry
end PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_loop_inv_2_preserved_goal2
