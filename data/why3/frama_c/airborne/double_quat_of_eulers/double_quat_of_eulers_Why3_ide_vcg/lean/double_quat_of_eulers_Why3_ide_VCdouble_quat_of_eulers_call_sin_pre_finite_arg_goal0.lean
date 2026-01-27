import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.double_quat_of_eulers.lib.lean.Axiomatic19.Axiomatic19
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.double_quat_of_eulers.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace double_quat_of_eulers_Why3_ide_VCdouble_quat_of_eulers_call_sin_pre_finite_arg_goal0
theorem goal0 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_1 : ℝ := r / (2 : ℝ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Axiomatic19.p_rvalid_doubleeulers t t_1 a → Cfloat.is_float64 r → Cfloat.is_float64 (t_1 (Memory.shift a (2 : ℤ))) → Cfloat.is_float64 (t_1 (Memory.shift a (1 : ℤ))) → Cfloat.is_float64 r_1 → Cfloat.is_finite64 r_1
  := sorry
end double_quat_of_eulers_Why3_ide_VCdouble_quat_of_eulers_call_sin_pre_finite_arg_goal0
