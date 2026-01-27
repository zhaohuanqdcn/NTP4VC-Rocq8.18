import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_differential.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_differential.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_quat_differential_Why3_ide_VCfloat_quat_differential_call_cos_pre_finite_arg_goal2
theorem goal2 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (r : ℝ) (a_1 : Memory.addr) (t : ℤ -> ℤ) (r_1 : ℝ) : let r_2 : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_3 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_4 : ℝ := t_1 (Memory.shift a (2 : ℤ)); let r_5 : ℝ := r_2 * r_2 + r_3 * r_3 + r_4 * r_4; (0 : ℝ) ≤ r → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (0 : ℝ) ≤ r_5 → Memory.linked t → Cfloat.is_finite32 r → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Axiomatic15.p_valid_floatquat t t_1 a_1 → Axiomatic15.p_rvalid_floatrates t t_1 a → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_finite32 r_5 → Cfloat.is_finite64 (r_1 * r / (2 : ℝ))
  := sorry
end float_quat_differential_Why3_ide_VCfloat_quat_differential_call_cos_pre_finite_arg_goal2
