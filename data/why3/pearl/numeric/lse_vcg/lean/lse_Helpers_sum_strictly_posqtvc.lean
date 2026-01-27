import Why3.Base
import Why3.real.Sum
import Why3.ieee_float.RoundingMode
import Why3.ufloat.USingle
import Why3.ufloat.HelperLemmas
import Why3.ufloat.USingleLemmas
open Classical
open Lean4Why3
namespace lse_Helpers_sum_strictly_posqtvc
axiom abs_fun : (ℤ -> ℝ) -> ℤ -> ℝ
axiom abs_fun'def (f : ℤ -> ℝ) (i : ℤ) : abs_fun f i = abs (f i)
axiom abs_real_fun : (ℤ -> USingle.usingle) -> ℤ -> ℝ
axiom abs_real_fun'def (f : ℤ -> USingle.usingle) (i : ℤ) : abs_real_fun f i = abs_fun (USingleLemmas.real_fun f) i
axiom usum_rec : (ℤ -> USingle.usingle) -> ℤ -> ℤ -> USingle.usingle
axiom usum_rec'def (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : if b - a ≤ (0 : ℤ) then usum_rec f a b = USingle.uzero else if b - a = (1 : ℤ) then usum_rec f a b = f (b - (1 : ℤ)) else usum_rec f a b = USingle.uadd (usum_rec f a (b - (1 : ℤ))) (f (b - (1 : ℤ)))
axiom usum_rec'spec (b : ℤ) (a : ℤ) (f : ℤ -> USingle.usingle) (fact0 : (0 : ℤ) ≤ b - a) : abs (USingle.to_real (usum_rec f a b) - real.Sum.sum (USingleLemmas.real_fun f) a b) ≤ real.Sum.sum (abs_real_fun f) a b * (USingle.eps * Int.to_Real (b - a))
axiom log_error : ℝ
axiom log_error_bounds : (0 : ℝ) ≤ log_error ∧ log_error ≤ (1 : ℝ)
axiom log_approx : USingle.usingle -> USingle.usingle
axiom log_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log_approx x) - Real.log (USingle.to_real x)) ≤ abs (Real.log (USingle.to_real x)) * log_error
axiom log2_error : ℝ
axiom log2_error_bounds : (0 : ℝ) ≤ log2_error ∧ log2_error ≤ (1 : ℝ)
axiom log2_approx : USingle.usingle -> USingle.usingle
axiom log2_approx'spec (x : USingle.usingle) (fact0 : (0 : ℝ) < USingle.to_real x) : abs (USingle.to_real (log2_approx x) - Real.logb 2 (USingle.to_real x)) ≤ abs (Real.logb 2 (USingle.to_real x)) * log2_error
axiom exp_error : ℝ
axiom exp_error_bounds : (0 : ℝ) ≤ exp_error ∧ exp_error ≤ (1 : ℝ) / 8
axiom exp_approx : USingle.usingle -> USingle.usingle
axiom exp_approx'spec (x : USingle.usingle) : abs (USingle.to_real (exp_approx x) - Real.exp (USingle.to_real x)) ≤ exp_error * Real.exp (USingle.to_real x)
theorem sum_strictly_pos'vc (a : ℤ) (b : ℤ) (f : ℤ -> ℝ) (fact0 : a < b) (fact1 : ∀(i : ℤ), a ≤ i ∧ i < b → (0 : ℝ) < f i) : (0 : ℝ) < real.Sum.sum f a b ∧ real.Sum.sum f a b = real.Sum.sum (abs_fun f) a b
  := sorry
end lse_Helpers_sum_strictly_posqtvc
