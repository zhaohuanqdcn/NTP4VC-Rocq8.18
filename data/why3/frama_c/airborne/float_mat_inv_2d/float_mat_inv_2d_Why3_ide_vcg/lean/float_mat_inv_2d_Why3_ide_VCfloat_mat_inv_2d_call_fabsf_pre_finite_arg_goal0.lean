import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_mat_inv_2d.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_inv_2d_Why3_ide_VCfloat_mat_inv_2d_call_fabsf_pre_finite_arg_goal0
theorem goal0 (a : Memory.addr) (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let r : ℝ := t_1 a_2; let r_1 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a (2 : ℤ)); let r_3 : ℝ := t_1 (Memory.shift a (3 : ℤ)); let r_4 : ℝ := r * r_3 + -(r_1 * r_2); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Memory.valid_rd t a_2 (4 : ℤ) → Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (4 : ℤ) → Cfloat.is_float32 r_4 → Cfloat.is_finite32 r_4
  := sorry
end float_mat_inv_2d_Why3_ide_VCfloat_mat_inv_2d_call_fabsf_pre_finite_arg_goal0
