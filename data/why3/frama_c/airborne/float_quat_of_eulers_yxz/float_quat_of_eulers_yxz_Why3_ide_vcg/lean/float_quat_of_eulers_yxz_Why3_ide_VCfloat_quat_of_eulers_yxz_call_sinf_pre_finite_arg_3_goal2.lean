import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_eulers_yxz.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_eulers_yxz.lib.lean.Compound.Compound
import Why3.Square.Square
open Classical
open Lean4Why3
namespace float_quat_of_eulers_yxz_Why3_ide_VCfloat_quat_of_eulers_yxz_call_sinf_pre_finite_arg_3_goal2
theorem goal2 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_1 : ℝ := r / (2 : ℝ); let r_2 : ℝ := Real.sin r_1; let r_3 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_4 : ℝ := r_3 / (2 : ℝ); let r_5 : ℝ := Real.sin r_4; let r_6 : ℝ := Real.cos r_1; let r_7 : ℝ := Real.cos r_4; let r_8 : ℝ := t_1 (Memory.shift a (2 : ℤ)); let r_9 : ℝ := r_8 / (2 : ℝ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → r_2 ≤ (1 : ℝ) → r_5 ≤ (1 : ℝ) → r_6 ≤ (1 : ℝ) → r_7 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r_2 → -(1 : ℝ) ≤ r_5 → -(1 : ℝ) ≤ r_6 → -(1 : ℝ) ≤ r_7 → Memory.linked t → Axiomatic15.p_rvalid_floateulers t t_1 a → Cfloat.is_float32 r → Cfloat.is_float32 r_8 → Cfloat.is_float32 r_3 → Cfloat.is_finite32 r_1 → Cfloat.is_finite32 r_4 → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_9 → Cfloat.is_float32 r_4 → Cfloat.is_finite32 r_2 → Cfloat.is_finite32 r_5 → Cfloat.is_finite32 r_6 → Cfloat.is_finite32 r_7 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_7 → Cfloat.is_finite32 r_9
  := sorry
end float_quat_of_eulers_yxz_Why3_ide_VCfloat_quat_of_eulers_yxz_call_sinf_pre_finite_arg_3_goal2
