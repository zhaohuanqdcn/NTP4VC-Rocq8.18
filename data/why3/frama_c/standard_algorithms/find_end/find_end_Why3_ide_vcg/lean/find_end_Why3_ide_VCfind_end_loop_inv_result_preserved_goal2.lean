import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_loop_inv_result_preserved_goal2
theorem goal2 (i : ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let x : ℤ := i + i_2; let a_2 : Memory.addr := Memory.shift a_1 i_2; (0 : ℤ) < i → i ≤ i_1 → x ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → i_1 ≤ (4294967295 : ℤ) + i → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 ((1 : ℤ) + i_2) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Memory.valid_rd t a_2 i → ¬Axiomatic.p_equalranges_1' t_1 t_1 a_2 i a → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) (i + i_2 - (1 : ℤ)) a i → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) x a i
  := sorry
end find_end_Why3_ide_VCfind_end_loop_inv_result_preserved_goal2
