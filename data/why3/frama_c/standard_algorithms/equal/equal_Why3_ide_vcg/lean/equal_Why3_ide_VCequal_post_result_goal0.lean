import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.equal.lib.lean.Compound.Compound
import frama_c.standard_algorithms.equal.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace equal_Why3_ide_VCequal_post_result_goal0
theorem goal0 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (a_1 : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); let x_1 : ℤ := t_1 (Memory.shift a_1 i_1); i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 x → Cint.is_sint32 x_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → (Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a → i_1 = i) → (¬Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a → ¬x_1 = x) → (¬Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a → i_1 < i) → (¬Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a → Axiomatic.p_equalranges_1' t_1 t_1 a_1 i_1 a) → Axiomatic.p_equalranges_1' t_1 t_1 a_1 i a = (i_1 = i)
  := sorry
end equal_Why3_ide_VCequal_post_result_goal0
