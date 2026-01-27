import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search_n.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search_n.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_n_Why3_ide_VCsearch_n_assert_rte_unsigned_overflow_goal8
theorem goal8 (a : Memory.addr) (i_3 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_4 : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_3; let x : ℤ := t_1 a_1; let x_1 : ℤ := t_1 (Memory.shift a (i - (1 : ℤ))); ¬x = i_4 → (0 : ℤ) < i_1 → i_1 ≤ i_2 → i_3 < i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i ≤ (1 : ℤ) + i_3 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 i_4 → Cint.is_sint32 x → Axiomatic.p_constantrange t_1 a i i_3 i_4 → ¬Axiomatic.p_hasconstantsubrange t_1 a i_3 i_1 i_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x_1 → ((0 : ℤ) < i → ¬x_1 = i_4) → i_3 ≤ (4294967294 : ℤ)
  := sorry
end search_n_Why3_ide_VCsearch_n_assert_rte_unsigned_overflow_goal8
