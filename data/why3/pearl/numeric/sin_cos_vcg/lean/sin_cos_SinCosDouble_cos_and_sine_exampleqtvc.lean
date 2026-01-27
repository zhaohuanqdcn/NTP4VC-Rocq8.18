import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.UDouble
import Why3.ufloat.HelperLemmas
import Why3.ufloat.UDoubleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosDouble_cos_and_sine_exampleqtvc
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
theorem cos_and_sine_example'vc (a : UDouble.udouble) (fact0 : abs (UDouble.to_real a) ≤ sin_max) (fact1 : abs (UDouble.to_real a) ≤ cos_max) : abs (UDouble.to_real a) ≤ sin_max ∧ (∀(o1 : UDouble.udouble), abs (UDouble.to_real o1 - Real.sin (UDouble.to_real a)) ≤ sin_rel_err * abs (Real.sin (UDouble.to_real a)) + sin_abs_err → abs (UDouble.to_real a) ≤ sin_max ∧ (∀(o2 : UDouble.udouble), abs (UDouble.to_real o2 - Real.sin (UDouble.to_real a)) ≤ sin_rel_err * abs (Real.sin (UDouble.to_real a)) + sin_abs_err → abs (UDouble.to_real a) ≤ cos_max ∧ (∀(o3 : UDouble.udouble), abs (UDouble.to_real o3 - Real.cos (UDouble.to_real a)) ≤ cos_rel_err * abs (Real.cos (UDouble.to_real a)) + cos_abs_err → abs (UDouble.to_real a) ≤ cos_max ∧ (∀(o4 : UDouble.udouble), abs (UDouble.to_real o4 - Real.cos (UDouble.to_real a)) ≤ cos_rel_err * abs (Real.cos (UDouble.to_real a)) + cos_abs_err → (let a1 : ℝ := UDouble.to_real a; let t : ℝ := (1 : ℝ) + UDouble.eps; let crel : ℝ := UDouble.eps + cos_rel_err * ((2 : ℝ) + cos_rel_err) * t; let srel : ℝ := UDouble.eps + sin_rel_err * ((2 : ℝ) + sin_rel_err) * t; abs (UDouble.to_real (UDouble.uadd (UDouble.umul o4 o3) (UDouble.umul o2 o1)) - (1 : ℝ)) ≤ crel + srel + UDouble.eps + (t + srel) * (t * cos_abs_err * ((2 : ℝ) * ((1 : ℝ) + cos_rel_err) * abs (Real.cos a1) + cos_abs_err) + UDouble.eta) + (t + crel) * (t * sin_abs_err * ((2 : ℝ) * ((1 : ℝ) + sin_rel_err) * abs (Real.sin a1) + sin_abs_err) + UDouble.eta))))))
  := sorry
end sin_cos_SinCosDouble_cos_and_sine_exampleqtvc
