import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.binary_search.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.binary_search.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace binary_search_Why3_ide_VCbinary_search_post_result_goal0
theorem goal0 (a : Memory.addr) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_3 : ℤ) : let a_1 : Memory.addr := Memory.shift a i_2; let x : ℤ := t_1 a_1; i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Cint.is_sint32 i_3 → Axiomatic.p_sorted_1' t_1 a (0 : ℤ) i_1 → Cint.is_sint32 x → Axiomatic.p_lowerbound_1' t_1 a i_2 i_1 i → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_2 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → (if i_2 < i_1 then Memory.valid_rd t a_1 (1 : ℤ) ∧ (if x ≤ i then i_3 = (1 : ℤ) else i_3 = (0 : ℤ)) else i_3 = (0 : ℤ)) → (∃(i_4 : ℤ), t_1 (Memory.shift a i_4) = i ∧ (0 : ℤ) ≤ i_4 ∧ i_4 < i_1) = (¬i_3 = (0 : ℤ))
  := sorry
end binary_search_Why3_ide_VCbinary_search_post_result_goal0
