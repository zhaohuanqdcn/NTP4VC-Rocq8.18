import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_end.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_end.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_end_Why3_ide_VCfind_end_loop_inv_last_preserved_goal1
theorem goal1 (a_1 : Memory.addr) (i_4 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_5 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_4; let x : ℤ := i_2 + i_4; let x_1 : ℤ := i_2 + i_4 - (1 : ℤ); Axiomatic.p_equalranges_1' t_1 t_1 a_2 i_2 a = (¬i_5 = (0 : ℤ)) → (0 : ℤ) < i_2 → i_1 < i_3 → i_2 ≤ i_3 → x ≤ i_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → i_4 ≤ (4294967294 : ℤ) → i_3 ≤ (4294967295 : ℤ) + i_2 → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_uint32 i_4 → Cint.is_sint32 i_5 → Cint.is_uint32 ((1 : ℤ) + i_4) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_3 → Memory.valid_rd t a_2 i_2 → (if i_5 = (0 : ℤ) then i_1 = i else i_4 = i_1) → (i < i_3 → Axiomatic.p_equalranges_1' t_1 t_1 (Memory.shift a_1 i) i_2 a) → (i_3 = i → ¬Axiomatic.p_hassubrange_1' t_1 a_1 (0 : ℤ) x_1 a i_2) → (i < i_3 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 ((1 : ℤ) + i) x_1 a i_2) → i_3 = i ∨ i + i_2 ≤ i_3 → ¬Axiomatic.p_hassubrange_1' t_1 a_1 ((1 : ℤ) + i_1) x a i_2
  := sorry
end find_end_Why3_ide_VCfind_end_loop_inv_last_preserved_goal1
