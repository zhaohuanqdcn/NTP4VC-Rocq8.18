import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.search_n.lib.lean.Compound.Compound
import frama_c.standard_algorithms.search_n.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace search_n_Why3_ide_VCsearch_n_loop_inv_constant_preserved_goal2
theorem goal2 (i_4 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i_1 : ℤ) (i_5 : ℤ) : let x : ℤ := (1 : ℤ) + i_4; let a_1 : Memory.addr := Memory.shift a i_4; let x_1 : ℤ := t_1 a_1; let x_2 : ℤ := t_1 (Memory.shift a (i - (1 : ℤ))); (0 : ℤ) < i_2 → i_2 ≤ i_3 → i_4 < i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_4 ≤ (4294967294 : ℤ) → i ≤ x → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i_5 → Cint.is_uint32 x → Cint.is_sint32 x_1 → Axiomatic.p_constantrange t_1 a i i_4 i_5 → ¬Axiomatic.p_hasconstantsubrange t_1 a i_4 i_2 i_5 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_3 → Memory.valid_rd t a_1 (1 : ℤ) → Cint.is_sint32 x_2 → Cint.is_sint32 (t_1 (Memory.shift a (i_1 - (1 : ℤ)))) → (if x_1 = i_5 then i_1 = i ∧ ¬i_1 + i_2 = x ∧ i_1 ≤ x ∧ i_4 ≤ (4294967294 : ℤ) + i_1 else x = i_1) → ((0 : ℤ) < i → ¬x_2 = i_5) → Axiomatic.p_constantrange t_1 a i_1 x i_5
  := sorry
end search_n_Why3_ide_VCsearch_n_loop_inv_constant_preserved_goal2
