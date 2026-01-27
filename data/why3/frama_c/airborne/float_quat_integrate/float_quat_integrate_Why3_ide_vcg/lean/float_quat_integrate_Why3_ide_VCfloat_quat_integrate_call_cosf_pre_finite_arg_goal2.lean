import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_integrate.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_integrate.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_quat_integrate_Why3_ide_VCfloat_quat_integrate_call_cosf_pre_finite_arg_goal2
theorem goal2 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (r : ℝ) (r_1 : ℝ) (t : ℤ -> ℤ) : let r_3 : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_4 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_5 : ℝ := t_1 (Memory.shift a (2 : ℤ)); let r_6 : ℝ := r_3 * r_3 + r_4 * r_4 + r_5 * r_5; let r_7 : ℝ := (1 : ℝ) / (2 : ℝ) * r * r_1; (0 : ℝ) ≤ r → (1 : ℝ) / (85070591730234615865843651857942052864 : ℝ) < r → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → (0 : ℝ) ≤ r_6 → Memory.linked t → Cfloat.is_finite32 r → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Axiomatic15.p_rvalid_floatrates t t_1 a → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_7 → Cfloat.is_finite32 r_6 → Cfloat.is_finite32 r_7
  := sorry
end float_quat_integrate_Why3_ide_VCfloat_quat_integrate_call_cosf_pre_finite_arg_goal2
