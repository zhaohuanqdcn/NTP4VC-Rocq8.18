import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.double_rmat_of_eulers_321.lib.lean.Axiomatic19.Axiomatic19
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.double_rmat_of_eulers_321.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace double_rmat_of_eulers_321_Why3_ide_VCdouble_rmat_of_eulers_321_call_sin_pre_finite_arg_3_goal2
theorem goal2 (t_1 : Memory.addr -> ℝ) (a : Memory.addr) (r : ℝ) (r_1 : ℝ) (r_2 : ℝ) (r_3 : ℝ) (t : ℤ -> ℤ) : let r_4 : ℝ := t_1 (Memory.shift a (0 : ℤ)); let r_5 : ℝ := t_1 (Memory.shift a (1 : ℤ)); let r_6 : ℝ := t_1 (Memory.shift a (2 : ℤ)); r ≤ (1 : ℝ) → r_1 ≤ (1 : ℝ) → r_2 ≤ (1 : ℝ) → r_3 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r → -(1 : ℝ) ≤ r_1 → -(1 : ℝ) ≤ r_2 → -(1 : ℝ) ≤ r_3 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cfloat.is_finite64 r → Cfloat.is_finite64 r_1 → Cfloat.is_finite64 r_2 → Cfloat.is_finite64 r_3 → Cfloat.is_float64 r → Cfloat.is_float64 r_1 → Cfloat.is_float64 r_2 → Cfloat.is_float64 r_3 → Axiomatic19.p_rvalid_doubleeulers t t_1 a → Cfloat.is_finite64 r_4 → Cfloat.is_finite64 r_5 → Cfloat.is_float64 r_4 → Cfloat.is_float64 r_6 → Cfloat.is_float64 r_5 → Cfloat.is_finite64 r_6
  := sorry
end double_rmat_of_eulers_321_Why3_ide_VCdouble_rmat_of_eulers_321_call_sin_pre_finite_arg_3_goal2
