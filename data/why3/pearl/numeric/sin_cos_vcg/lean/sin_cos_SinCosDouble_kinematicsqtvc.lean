import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosDouble_kinematicsqtvc
axiom sin_rel_err : ℝ
axiom sin_rel_err_range : (0 : ℝ) ≤ sin_rel_err
axiom sin_abs_err : ℝ
axiom sin_abs_err_range : (0 : ℝ) ≤ sin_abs_err
axiom sin_max : ℝ
axiom sin_max_range : (0 : ℝ) ≤ sin_max
axiom cos_rel_err : ℝ
axiom cos_rel_err_range : (0 : ℝ) ≤ cos_rel_err
axiom cos_abs_err : ℝ
axiom cos_abs_err_range : (0 : ℝ) ≤ cos_abs_err
axiom cos_max : ℝ
axiom cos_max_range : (0 : ℝ) ≤ cos_max
theorem kinematics'vc (theta1 : UDouble.udouble) (theta2 : UDouble.udouble) (fact0 : abs (UDouble.to_real theta1) ≤ (1 : ℝ) / 4 * sin_max) (fact1 : abs (UDouble.to_real theta2) ≤ (1 : ℝ) / 4 * sin_max) : let o1 : UDouble.udouble := UDouble.uadd theta1 theta2; abs (UDouble.to_real o1) ≤ sin_max ∧ (∀(o2 : UDouble.udouble), abs (UDouble.to_real o2 - Real.sin (UDouble.to_real o1)) ≤ sin_rel_err * abs (Real.sin (UDouble.to_real o1)) + sin_abs_err → (∀(o3 : UDouble.udouble), UDouble.to_real o3 = (5 : ℝ) / 2 → abs (UDouble.to_real theta1) ≤ sin_max ∧ (∀(o4 : UDouble.udouble), abs (UDouble.to_real o4 - Real.sin (UDouble.to_real theta1)) ≤ sin_rel_err * abs (Real.sin (UDouble.to_real theta1)) + sin_abs_err → (∀(o5 : UDouble.udouble), UDouble.to_real o5 = (1 : ℝ) / 2 → (let theta11 : ℝ := UDouble.to_real theta1; let theta21 : ℝ := UDouble.to_real theta2; let t1 : ℝ := (1 : ℝ) + UDouble.eps; let t2 : ℝ := UDouble.eps + sin_rel_err * t1; abs (UDouble.to_real (UDouble.uadd (UDouble.umul o5 o4) (UDouble.umul o3 o2)) - ((1 : ℝ) / 2 * Real.sin theta11 + (5 : ℝ) / 2 * Real.sin (theta11 + theta21))) ≤ ((2 : ℝ) * t2 + UDouble.eps) * ((1 : ℝ) / 2 * abs (Real.sin theta11) + (5 : ℝ) / 2 * abs (Real.sin (theta11 + theta21))) + (t1 + t2) * (t1 * ((1 : ℝ) / 2 * sin_abs_err + (5 : ℝ) / 2 * (UDouble.eps * abs (theta11 + theta21) * ((1 : ℝ) + sin_rel_err) + sin_abs_err)) + (2 : ℝ) * UDouble.eta))))))
  := sorry
end sin_cos_SinCosDouble_kinematicsqtvc
