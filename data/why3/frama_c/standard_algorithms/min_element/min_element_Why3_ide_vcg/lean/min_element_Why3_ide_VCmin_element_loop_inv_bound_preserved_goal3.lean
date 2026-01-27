import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.min_element.lib.lean.Compound.Compound
import frama_c.standard_algorithms.min_element.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace min_element_Why3_ide_VCmin_element_loop_inv_bound_preserved_goal3
theorem goal3 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let a_2 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a i_2; (0 : ℤ) < i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → i_2 ≤ (4294967294 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_uint32 i_2 → Cint.is_uint32 ((1 : ℤ) + i_2) → Cint.is_sint32 (t_1 a_1) → Cint.is_sint32 x → Cint.is_sint32 (t_1 a_3) → Memory.valid_rd t a_1 i → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → Axiomatic.p_lowerbound_1' t_1 a (0 : ℤ) i_2 x → Axiomatic.p_strictlowerbound_1' t_1 a (0 : ℤ) i_1 x → -(1 : ℤ) ≤ i_2
  := sorry
end min_element_Why3_ide_VCmin_element_loop_inv_bound_preserved_goal3
