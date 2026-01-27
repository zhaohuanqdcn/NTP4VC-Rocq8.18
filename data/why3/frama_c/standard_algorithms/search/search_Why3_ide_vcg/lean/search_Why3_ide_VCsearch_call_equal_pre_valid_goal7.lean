import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_Why3_ide_VCsearch_call_equal_pre_valid_goal7
theorem goal7 (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i + i_2; i ≤ i_1 → x ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_1 ≤ (4294967295 : ℤ) + i → x ≤ (1 : ℤ) + i_1 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i + i_2 - (1 : ℤ)) a i → Memory.valid_rd t (Memory.shift a_1 i_2) i
  := sorry
end search_Why3_ide_VCsearch_call_equal_pre_valid_goal7
