import Why3.Base
import Why3.Qed.Qed
import frama_c.airborne.vect_scale.lib.lean.S2_FloatVect3.S2_FloatVect3
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
open Classical
open Lean4Why3
namespace vect_scale_Why3_ide_VCvect_scale_call_sqrtf_pre_finite_arg_goal0
theorem goal0 (f : S2_FloatVect3.s2_floatvect3) : let r : ℝ := S2_FloatVect3.s2_floatvect3.f2_floatvect3_x f; let r_1 : ℝ := S2_FloatVect3.s2_floatvect3.f2_floatvect3_y f; Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_finite32 (r * r + r_1 * r_1)
  := sorry
end vect_scale_Why3_ide_VCvect_scale_call_sqrtf_pre_finite_arg_goal0
