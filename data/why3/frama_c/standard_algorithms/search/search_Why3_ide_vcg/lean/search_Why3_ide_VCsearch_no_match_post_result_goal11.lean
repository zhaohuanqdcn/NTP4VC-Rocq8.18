import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_Why3_ide_VCsearch_no_match_post_result_goal11
theorem goal11 (i : ℤ) (i_1 : ℤ) (a_1 : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i + i_1; let a_2 : Memory.addr := Memory.shift a_1 i; ¬i_3 = (0 : ℤ) → i_1 ≤ i_2 → x ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967295 : ℤ) + i_1 → x ≤ (1 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i_3 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2 → Memory.valid_rd t a_2 i_1 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) i_2 a i_1 → Axiomatic.p_equalranges_1' t_1 t_1 a_2 i_1 a → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i + i_1 - (1 : ℤ)) a i_1 → i_2 = i
  := sorry
end search_Why3_ide_VCsearch_no_match_post_result_goal11
