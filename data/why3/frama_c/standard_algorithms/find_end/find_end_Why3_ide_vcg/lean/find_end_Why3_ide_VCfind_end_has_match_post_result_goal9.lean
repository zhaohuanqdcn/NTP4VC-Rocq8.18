import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_has_match_post_result_goal9
theorem goal9 (a_1 : Memory.addr) (i_4 : ℤ) (i : ℤ) (i_3 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_4; let x : ℤ := i + i_3 - (1 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) i_1 a i → (if (0 : ℤ) < i then if i ≤ i_1 then i_2 = i_1 ∧ i_2 < i + i_3 ∧ i_2 ≤ (4294967295 : ℤ) + i ∧ (i_4 < i_2 → Axiomatic.p_equalranges_1' t_1 t_1 a_2 i a) ∧ (i_4 = i_2 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) x a i) ∧ (i_4 < i_2 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 ((1 : ℤ) + i_4) x a i) ∧ (i_4 = i_2 ∨ i + i_4 ≤ i_2) else i_4 = i_1 else i_4 = i_1) → Axiomatic.p_equalranges_1' t_1 t_1 a_2 i a
  := sorry
end find_end_Why3_ide_VCfind_end_has_match_post_result_goal9
