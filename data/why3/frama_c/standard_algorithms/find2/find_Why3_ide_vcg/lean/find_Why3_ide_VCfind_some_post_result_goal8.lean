import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find2.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.find2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_some_post_result_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) (i : ℤ) : let x : ℤ := t_1 (Memory.shift a i_2); i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_1 ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 i → Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_1 i → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_2 i → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → x = i
  := sorry
end find_Why3_ide_VCfind_some_post_result_goal8
