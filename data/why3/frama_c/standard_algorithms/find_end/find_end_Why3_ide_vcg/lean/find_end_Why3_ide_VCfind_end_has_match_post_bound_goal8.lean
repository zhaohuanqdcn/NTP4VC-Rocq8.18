import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_has_match_post_bound_goal8
theorem goal8 (i : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) : let x : ℤ := i + i_2 - (1 : ℤ); let x_1 : ℤ := i + i_3; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) i_1 a i → (if (0 : ℤ) < i then t_2 = t_1 ∧ (if i ≤ i_1 then t_3 = t_2 ∧ i_1 < i + i_2 ∧ i_1 ≤ (4294967295 : ℤ) + i ∧ (i_3 < i_1 → Axiomatic.p_equalranges_1' t_3 t_3 (Memory.shift a_1 i_3) i a) ∧ (i_3 = i_1 → ¬Axiomatic.p_hassubrange_1' t_3 a_1 (0 : ℤ) x a i) ∧ (i_3 < i_1 → ¬Axiomatic.p_hassubrange_1' t_3 a_1 ((1 : ℤ) + i_3) x a i) ∧ (i_3 = i_1 ∨ x_1 ≤ i_1) else i_3 = i_1) else i_3 = i_1) → (0 : ℤ) ≤ i_3 ∧ x_1 ≤ i_1
  := sorry
end find_end_Why3_ide_VCfind_end_has_match_post_bound_goal8
