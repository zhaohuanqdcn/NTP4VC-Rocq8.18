import Why3.Base
open Classical
open Lean4Why3
namespace my_exp_log_ExpLogLemmas_exp_invqtvc
theorem exp_inv'vc (x : ℝ) (fact0 : ¬x = (0 : ℝ)) : Real.exp (-x) = (1 : ℝ) / Real.exp x
  := sorry
end my_exp_log_ExpLogLemmas_exp_invqtvc
