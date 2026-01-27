import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.min_element.lib.lean.Compound.Compound
import frama_c.standard_algorithms.min_element.lib.lean.Axiomatic.Axiomatic
open Classical
open Lean4Why3
namespace min_element_Why3_ide_VCmin_element_loop_inv_first_established_goal5
theorem goal5 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 a_1; (0 : ℤ) < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_sint32 x → Memory.valid_rd t a_1 i → Axiomatic.p_strictlowerbound_1' t_1 a (0 : ℤ) (0 : ℤ) x
  := sorry
end min_element_Why3_ide_VCmin_element_loop_inv_first_established_goal5
