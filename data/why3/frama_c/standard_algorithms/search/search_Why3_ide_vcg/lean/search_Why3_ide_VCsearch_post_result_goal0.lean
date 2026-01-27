import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_Why3_ide_VCsearch_post_result_goal0
theorem goal0 (i_1 : ℤ) (i_3 : ℤ) (a_1 : Memory.addr) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i_2 : ℤ) (i_4 : ℤ) (p_1 : Bool) (t_1 : Memory.addr -> ℤ) (p : Bool) : let x : ℤ := i_1 + i_3; let a_2 : Memory.addr := Memory.shift a_1 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2 → (if i_1 ≤ i_2 then p_1 = false ∧ i_2 ≤ (4294967295 : ℤ) + i_1 ∧ x ≤ (1 : ℤ) + i_2 ∧ ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i_1 + i_3 - (1 : ℤ)) a i_1 ∧ (if x ≤ i_2 then p = false ∧ i_3 = i ∧ ¬i_4 = (0 : ℤ) ∧ Memory.valid_rd t a_2 i_1 ∧ Axiomatic.p_equalranges_1' t_1 t_1 a_2 i_1 a else i_2 = i) else i_2 = i) → (0 : ℤ) ≤ i ∧ i ≤ i_2
  := sorry
end search_Why3_ide_VCsearch_post_result_goal0
