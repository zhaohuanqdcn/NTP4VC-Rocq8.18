import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.find2.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.standard_algorithms.find2.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace find_Why3_ide_VCfind_none_post_result_goal6
theorem goal6 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → ¬Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i x → Axiomatic.p_hasvalue_1' t_1 a (0 : ℤ) i_1 x
  := sorry
end find_Why3_ide_VCfind_none_post_result_goal6
