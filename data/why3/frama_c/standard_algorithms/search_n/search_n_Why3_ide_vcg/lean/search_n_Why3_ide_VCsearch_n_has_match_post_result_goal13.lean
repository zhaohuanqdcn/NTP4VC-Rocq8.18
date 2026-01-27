import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search_n.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search_n.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_n_Why3_ide_VCsearch_n_has_match_post_result_goal13
theorem goal13 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (i_6 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (i_7 : ℤ) : let x : ℤ := t_1 (Memory.shift a (i - (1 : ℤ))); let x_1 : ℤ := (1 : ℤ) + i_6; let x_2 : ℤ := i_1 + i_2; let a_1 : Memory.addr := Memory.shift a i_6; let x_3 : ℤ := Cint.to_uint32 x_1; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_uint32 i_5 → Cint.is_uint32 i_6 → Cint.is_sint32 i_7 → Axiomatic.p_hasconstantsubrange t_1 a i_4 i_2 i_7 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_4 → Cint.is_sint32 x → (if (0 : ℤ) < i_2 then if i_2 ≤ i_4 then i_4 = i_3 ∧ i_5 = i_3 ∧ i_5 = i_4 ∧ i ≤ x_1 ∧ Axiomatic.p_constantrange t_1 a i i_6 i_7 ∧ ¬Axiomatic.p_hasconstantsubrange t_1 a i_6 i_2 i_7 ∧ (if i_6 < i_4 then i_1 = i ∧ x_2 = x_1 ∧ t_1 a_1 = i_7 ∧ i_1 ≤ x_3 ∧ i_6 ≤ (4294967294 : ℤ) ∧ x_3 ≤ (4294967295 : ℤ) + i_1 ∧ Memory.valid_rd t a_1 (1 : ℤ) else i_4 = i_1) ∧ ((0 : ℤ) < i → ¬x = i_7) else i_4 = i_1 else i_1 = (0 : ℤ)) → (0 : ℤ) ≤ i_1 ∧ x_2 ≤ i_4
  := sorry
end search_n_Why3_ide_VCsearch_n_has_match_post_result_goal13
