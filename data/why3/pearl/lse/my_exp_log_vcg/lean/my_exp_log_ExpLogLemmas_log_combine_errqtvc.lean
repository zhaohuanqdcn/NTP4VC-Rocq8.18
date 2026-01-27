import Why3.Base
open Classical
open Lean4Why3
namespace my_exp_log_ExpLogLemmas_log_combine_errqtvc
theorem log_combine_err'vc (x : ℝ) (b : ℝ) (a : ℝ) (x_approx : ℝ) (fact0 : (0 : ℝ) < x) (fact1 : b < x * ((1 : ℝ) - a)) (fact2 : abs (x_approx - x) ≤ x * a + b) : abs (Real.log x_approx - Real.log x) ≤ -Real.log ((1 : ℝ) - (a + b / x))
  := sorry
end my_exp_log_ExpLogLemmas_log_combine_errqtvc
