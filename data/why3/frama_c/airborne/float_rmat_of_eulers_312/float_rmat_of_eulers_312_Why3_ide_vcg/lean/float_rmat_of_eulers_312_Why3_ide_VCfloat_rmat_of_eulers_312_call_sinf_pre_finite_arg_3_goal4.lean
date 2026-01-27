import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Square.Square
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Compound.Compound
import frama_c.airborne.float_rmat_of_eulers_312.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cfloat.Cfloat
open Classical
open Lean4Why3
namespace float_rmat_of_eulers_312_Why3_ide_VCfloat_rmat_of_eulers_312_call_sinf_pre_finite_arg_3_goal4
theorem goal4 (t_1 : Memory.addr -> ℝ) (a_1 : Memory.addr) (a : Memory.addr) (t : ℤ -> ℤ) : let r : ℝ := t_1 (Memory.shift a_1 (0 : ℤ)); let r_1 : ℝ := Real.sin r; let r_2 : ℝ := t_1 (Memory.shift a_1 (1 : ℤ)); let r_3 : ℝ := Real.sin r_2; let r_4 : ℝ := Real.cos r; let r_5 : ℝ := Real.cos r_2; let r_6 : ℝ := t_1 (Memory.shift a_1 (2 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → r_1 ≤ (1 : ℝ) → r_3 ≤ (1 : ℝ) → r_4 ≤ (1 : ℝ) → r_5 ≤ (1 : ℝ) → -(1 : ℝ) ≤ r_1 → -(1 : ℝ) ≤ r_3 → -(1 : ℝ) ≤ r_4 → -(1 : ℝ) ≤ r_5 → Memory.linked t → Memory.valid_rw t a (9 : ℤ) → Axiomatic15.p_rvalid_floateulers t t_1 a_1 → Cfloat.is_finite32 r → Cfloat.is_finite32 r_2 → Cfloat.is_float32 r → Cfloat.is_float32 r_6 → Cfloat.is_float32 r_2 → Cfloat.is_finite32 r_1 → Cfloat.is_finite32 r_3 → Cfloat.is_finite32 r_4 → Cfloat.is_finite32 r_5 → Cfloat.is_float32 r_1 → Cfloat.is_float32 r_3 → Cfloat.is_float32 r_4 → Cfloat.is_float32 r_5 → Cfloat.is_finite32 r_6
  := sorry
end float_rmat_of_eulers_312_Why3_ide_VCfloat_rmat_of_eulers_312_call_sinf_pre_finite_arg_3_goal4
