import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.min_element.lib.lean.Compound.Compound
import frama_c.standard_algorithms.min_element.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace min_element_Why3_ide_VCmin_element_not_empty_post_min_goal11
theorem goal11 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a i_1); (0 : ℤ) < i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Axiomatic.p_lowerbound_1' t_1 a (0 : ℤ) i_2 x → Axiomatic.p_strictlowerbound_1' t_1 a (0 : ℤ) i_1 x → Axiomatic.p_minelement t_1 a i_2 i_1
  := sorry
end min_element_Why3_ide_VCmin_element_not_empty_post_min_goal11
