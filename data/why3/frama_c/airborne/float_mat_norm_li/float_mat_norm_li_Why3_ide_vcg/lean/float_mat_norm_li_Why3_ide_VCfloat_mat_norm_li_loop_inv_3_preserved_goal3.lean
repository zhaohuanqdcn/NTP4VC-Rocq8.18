import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_mat_norm_li.lib.lean.Axiomatic15.Axiomatic15
import frama_c.airborne.float_mat_norm_li.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_3_preserved_goal3
theorem goal3 (t_1 : Memory.addr -> ℝ) (t_2 : Memory.addr -> Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i_2 : ℤ) (r : ℝ) (i : ℤ) (i_1 : ℤ) (r_1 : ℝ) (t : ℤ -> ℤ) : let r_2 : ℝ := t_1 (Memory.shift (t_2 (Memory.shift a i_3)) i_2); (0 : ℝ) ≤ r → i_2 ≤ i → i_3 ≤ i_1 → (0 : ℤ) ≤ i_2 → i_2 < i → (0 : ℤ) ≤ i_3 → i_3 < i_1 → (0 : ℝ) ≤ r_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Cfloat.is_finite32 r_1 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_sint32 i_2 → Cint.is_sint32 i_3 → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cint.is_sint32 ((1 : ℤ) + i_2) → Axiomatic15.p_rvalid_float_mat_2' t t_2 a i_1 i → Cfloat.is_finite32 r_2 → Cfloat.is_float32 r_2 → r_2 = r_1 ∨ r_1 + r_2 = (0 : ℝ) → -(1 : ℤ) ≤ i_2
  := sorry
end float_mat_norm_li_Why3_ide_VCfloat_mat_norm_li_loop_inv_3_preserved_goal3
