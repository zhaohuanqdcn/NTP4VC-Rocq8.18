import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.find_first_of.lib.lean.Compound.Compound
import frama_c.standard_algorithms.find_first_of.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_first_of_Why3_ide_VCfind_first_of_not_found_post_result_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_3 : ℤ) (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_3); let a_2 : Memory.addr := Memory.shift a_1 i_2; let x_1 : ℤ := t_1 a_2; i_3 ≤ i → (0 : ℤ) ≤ i_2 → i_2 < i_1 → (0 : ℤ) ≤ i_3 → i_3 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 i_3 → Cint.is_sint32 x → Cint.is_sint32 x_1 → ¬Axiomatic.p_hasvalueof t_1 a_1 i_1 a i → ¬Axiomatic.p_hasvalueof t_1 a_1 i_2 a i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Memory.valid_rd t a_2 (1 : ℤ) → (Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i x_1 → x_1 = x) → (¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i x_1 → i_3 = i) → ¬(Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i x_1 → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_3 x_1)
  := sorry
end find_first_of_Why3_ide_VCfind_first_of_not_found_post_result_goal8
