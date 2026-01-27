import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_of_orientation_vect.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_of_orientation_vect.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_quat_of_orientation_vect_Why3_ide_VCfloat_quat_of_orientation_vect_call_sqrtf_pre_arg_positive_goal1
theorem goal1 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_1 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a (2 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Axiomatic15.p_rvalid_floatvect3 t t_1 a → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → (0 : ℝ) ≤ r * r + r_1 * r_1 + r_2 * r_2
  := sorry
end float_quat_of_orientation_vect_Why3_ide_VCfloat_quat_of_orientation_vect_call_sqrtf_pre_arg_positive_goal1
