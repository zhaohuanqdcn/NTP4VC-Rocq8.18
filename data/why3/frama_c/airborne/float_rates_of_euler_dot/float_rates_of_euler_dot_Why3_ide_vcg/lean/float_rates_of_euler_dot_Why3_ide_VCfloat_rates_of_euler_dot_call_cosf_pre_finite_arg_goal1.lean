import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_rates_of_euler_dot.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_rates_of_euler_dot.lib.lean.Compound.Compound
import Why3.Square.Square
open Classical
open Lean4Why3
namespace float_rates_of_euler_dot_Why3_ide_VCfloat_rates_of_euler_dot_call_cosf_pre_finite_arg_goal1
theorem goal1 (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a_1 (1 : ℤ)); let r_1 : ℝ := Real.sin r; let r_2 : ℝ := t_1 (Memory.shift a_1 (0 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → r_1 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r_1 → Memory.linked t → Axiomatic15.p_rvalid_floateulers t t_1 a → Axiomatic15.p_rvalid_floateulers t t_1 a_1 → Cfloat.is_finite32 r → Cfloat.is_float32 (t_1 (Memory.shift a (0 : ℤ))) → Cfloat.is_float32 r_2 → Cfloat.is_float32 (t_1 (Memory.shift a (2 : ℤ))) → Cfloat.is_float32 (t_1 (Memory.shift a (1 : ℤ))) → Cfloat.is_float32 r → Cfloat.is_finite32 r_1 → Cfloat.is_float32 r_1 → Cfloat.is_finite32 r_2
  := sorry
end float_rates_of_euler_dot_Why3_ide_VCfloat_rates_of_euler_dot_call_cosf_pre_finite_arg_goal1
