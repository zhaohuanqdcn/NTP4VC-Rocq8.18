import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace sin_cos_SinCosSingle_raytracerqtvc
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
theorem raytracer'vc (phi : USingle.usingle) (theta : USingle.usingle) (nz : USingle.usingle) (ny : USingle.usingle) (nx : USingle.usingle) (fact0 : abs (USingle.to_real phi) ≤ sin_max) (fact1 : abs (USingle.to_real phi) ≤ cos_max) (fact2 : abs (USingle.to_real theta) ≤ sin_max) (fact3 : abs (USingle.to_real theta) ≤ cos_max) : abs (USingle.to_real phi) ≤ sin_max ∧ (∀(o1 : USingle.usingle), abs (USingle.to_real o1 - Real.sin (USingle.to_real phi)) ≤ sin_rel_err * abs (Real.sin (USingle.to_real phi)) + sin_abs_err → abs (USingle.to_real theta) ≤ cos_max ∧ (∀(o2 : USingle.usingle), abs (USingle.to_real o2 - Real.cos (USingle.to_real theta)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real theta)) + cos_abs_err → abs (USingle.to_real theta) ≤ sin_max ∧ (∀(o3 : USingle.usingle), abs (USingle.to_real o3 - Real.sin (USingle.to_real theta)) ≤ sin_rel_err * abs (Real.sin (USingle.to_real theta)) + sin_abs_err → abs (USingle.to_real phi) ≤ cos_max ∧ (∀(o4 : USingle.usingle), abs (USingle.to_real o4 - Real.cos (USingle.to_real phi)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real phi)) + cos_abs_err → abs (USingle.to_real theta) ≤ cos_max ∧ (∀(o5 : USingle.usingle), abs (USingle.to_real o5 - Real.cos (USingle.to_real theta)) ≤ cos_rel_err * abs (Real.cos (USingle.to_real theta)) + cos_abs_err → (let nz1 : ℝ := USingle.to_real nz; let ny1 : ℝ := USingle.to_real ny; let nx1 : ℝ := USingle.to_real nx; let phi1 : ℝ := USingle.to_real phi; let theta1 : ℝ := USingle.to_real theta; let t1 : ℝ := (1 : ℝ) + USingle.eps; let t2c : ℝ := USingle.eps + cos_rel_err * t1; let t2s : ℝ := USingle.eps + sin_rel_err * t1; let t3c : ℝ := USingle.eps + (t2c + cos_rel_err + t2c * cos_rel_err) * t1; let t3s : ℝ := USingle.eps + (t2c + sin_rel_err + t2c * sin_rel_err) * t1; let t4 : ℝ := t3c + t2s + USingle.eps; abs (USingle.to_real (USingle.uadd (USingle.uadd (USingle.umul (USingle.umul nx o5) o4) (USingle.umul ny o3)) (USingle.umul (USingle.umul nz o2) o1)) - (nx1 * Real.cos theta1 * Real.cos phi1 + ny1 * Real.sin theta1 + nz1 * Real.cos theta1 * Real.sin phi1)) ≤ (t4 + t3s + USingle.eps) * (abs (nx1 * Real.cos theta1 * Real.cos phi1) + abs (ny1 * Real.sin theta1) + abs (nz1 * Real.cos theta1 * Real.sin phi1)) + (t1 + t3s) * ((t1 + t2s) * (t1 * (cos_abs_err * ((1 : ℝ) + t2c) * abs (nx1 * Real.cos theta1) + (t1 * cos_abs_err * abs nx1 + USingle.eta) * (((1 : ℝ) + cos_rel_err) * abs (Real.cos phi1) + cos_abs_err)) + USingle.eta) + (t1 + t3c) * (t1 * sin_abs_err * abs ny1 + USingle.eta)) + (t1 + t4) * (t1 * (sin_abs_err * ((1 : ℝ) + t2c) * abs (nz1 * Real.cos theta1) + (t1 * cos_abs_err * abs nz1 + USingle.eta) * (((1 : ℝ) + sin_rel_err) * abs (Real.sin phi1) + sin_abs_err)) + USingle.eta)))))))
  := sorry
end sin_cos_SinCosSingle_raytracerqtvc
