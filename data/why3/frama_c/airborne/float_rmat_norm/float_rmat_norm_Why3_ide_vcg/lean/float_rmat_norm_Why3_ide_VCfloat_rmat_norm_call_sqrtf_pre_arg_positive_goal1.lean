import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rmat_norm.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rmat_norm.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_rmat_norm_Why3_ide_VCfloat_rmat_norm_call_sqrtf_pre_arg_positive_goal1
theorem goal1 (a : Memory.addr) (t_1 : Memory.addr -> ℝ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let r : ℝ := t_1 (Memory.shift a_1 (0 : ℤ)); let r_1 : ℝ := t_1 (Memory.shift a_1 (1 : ℤ)); let r_2 : ℝ := t_1 (Memory.shift a_1 (2 : ℤ)); let r_3 : ℝ := t_1 (Memory.shift a_1 (3 : ℤ)); let r_4 : ℝ := t_1 (Memory.shift a_1 (4 : ℤ)); let r_5 : ℝ := t_1 (Memory.shift a_1 (5 : ℤ)); let r_6 : ℝ := t_1 (Memory.shift a_1 (6 : ℤ)); let r_7 : ℝ := t_1 (Memory.shift a_1 (7 : ℤ)); let r_8 : ℝ := t_1 (Memory.shift a_1 (8 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Axiomatic15.p_rvalid_floatrmat t t_1 a → Cfloat.is_float32 r → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_2 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_float32 r_5 → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_7 → Cfloat.is_float32 r_8 → (0 : ℝ) ≤ r * r + r_1 * r_1 + r_2 * r_2 + r_3 * r_3 + r_4 * r_4 + r_5 * r_5 + r_6 * r_6 + r_7 * r_7 + r_8 * r_8
  := sorry
end float_rmat_norm_Why3_ide_VCfloat_rmat_norm_call_sqrtf_pre_arg_positive_goal1
