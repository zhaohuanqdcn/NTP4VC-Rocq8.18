import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_eulers_zxy.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_eulers_zxy.lib.lean.Compound.Compound
import Why3.Square.Square
open Classical
open Lean4Why3
namespace float_quat_of_eulers_zxy_Why3_ide_VCfloat_quat_of_eulers_zxy_call_sinf_pre_finite_arg_2_goal1
theorem goal1 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_1 : ℝ := r / (2 : ℝ); let r_2 : ℝ := Real.sin r_1; let r_3 : ℝ := Real.cos r_1; let r_4 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_5 : ℝ := r_4 / (2 : ℝ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → r_2 ≤ (1 : ℝ) → r_3 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r_2 → -(1 : ℝ) ≤ r_3 → Memory.linked t → Axiomatic15.p_rvalid_floateulers t t_1 a → Cfloat.is_float32 r → Cfloat.is_float32 (t_1 (Memory.shift a (2 : ℤ))) → Cfloat.is_float32 r_4 → Cfloat.is_finite32 r_1 → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_5 → Cfloat.is_finite32 r_2 → Cfloat.is_finite32 r_3 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Cfloat.is_finite32 r_5
  := sorry
end float_quat_of_eulers_zxy_Why3_ide_VCfloat_quat_of_eulers_zxy_call_sinf_pre_finite_arg_2_goal1
