import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.partial_sort.lib.lean.A_Count.A_Count
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sort.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.partial_sort.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_post_goal0
theorem goal0 (a : Memory.addr) (t : Memory.addr -> ℤ) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (i_3 : ℤ) (p : Bool) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : (0 : ℤ) < A_Count.l_count_1' t a i_1 i i_2) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_uint32 i_1) (fact4 : Cint.is_uint32 i_3) (fact5 : Cint.is_sint32 i_2) (fact6 : i ≤ i_1 ∨ p = false ∧ i_3 ≤ i ∧ i ≤ i_3 ∧ i_1 ≤ i_3 ∧ (∀(i_4 : ℤ), Cint.is_sint32 i_4 → (∀(i_5 : ℤ), i_1 ≤ i_5 → i_5 < i_3 → ¬t (Memory.shift a i_5) = i_4) → A_Count.l_count_1' t a i_1 i_3 i_4 = (0 : ℤ))) : Axiomatic1.p_hasvalue_1' t a i_1 i i_2
  := sorry
end PositiveCountImpliesHasValueGeneral_Why3_ide_VCPositiveCountImpliesHasValueGeneral_post_goal0
