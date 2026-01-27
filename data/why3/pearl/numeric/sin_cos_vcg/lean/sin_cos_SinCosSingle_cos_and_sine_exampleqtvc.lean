import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosSingle_cos_and_sine_exampleqtvc
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
theorem cos_and_sine_example'vc (a : USingle.usingle) (fact0 : abs (USingle.to_real a) ≤ sin_max) (fact1 : abs (USingle.to_real a) ≤ cos_max) : abs (USingle.to_real a) ≤ sin_max ∧ (∀(o1 : USingle.usingle), abs (USingle.to_real o1 - Real.sin (USingle.to_real a)) ≤ sin_rel_err * abs (Real.sin (USingle.to_real a)) + sin_abs_err → abs (USingle.to_real a) ≤ sin_max ∧ (∀(o2 : USingle.usingle), abs (USingle.to_real o2 - Real.sin (USingle.to_real a)) ≤ sin_rel_err * abs (Real.sin (USingle.to_real a)) + sin_abs_err → abs (USingle.to_real a) ≤ cos_max ∧ (∀(o3 : USingle.usingle), abs (USingle.to_real o3 - Real.cos (USingle.to_real a)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real a)) + cos_abs_err → abs (USingle.to_real a) ≤ cos_max ∧ (∀(o4 : USingle.usingle), abs (USingle.to_real o4 - Real.cos (USingle.to_real a)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real a)) + cos_abs_err → (let a1 : ℝ := USingle.to_real a; let sa : ℝ := Real.sin a1; let ca : ℝ := Real.cos a1; let t : ℝ := (1 : ℝ) + USingle.eps; let crerr : ℝ := USingle.eps + (cos_rel_err + cos_rel_err + cos_rel_err * cos_rel_err) * t; let srerr : ℝ := USingle.eps + (sin_rel_err + sin_rel_err + sin_rel_err * sin_rel_err) * t; abs (USingle.to_real (USingle.uadd (USingle.umul o4 o3) (USingle.umul o2 o1)) - (1 : ℝ)) ≤ (crerr + srerr + USingle.eps) * (abs (ca * ca) + abs (sa * sa)) + ((t + srerr) * ((2 : ℝ) * (t * (cos_abs_err + cos_abs_err * cos_rel_err) * abs ca) + t * (cos_abs_err * cos_abs_err) + USingle.eta) + (t + crerr) * ((2 : ℝ) * (t * (sin_abs_err + sin_abs_err * sin_rel_err) * abs sa) + t * (sin_abs_err * sin_abs_err) + USingle.eta)))))))
  := sorry
end sin_cos_SinCosSingle_cos_and_sine_exampleqtvc
