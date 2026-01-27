import Why3.Base
open Classical
open Lean4Why3
namespace Square
axiom sqrt_lin1 (x : ℝ) (fact0 : (1 : ℝ) < x) : Real.sqrt x < x
axiom sqrt_lin0 (x : ℝ) (fact0 : (0 : ℝ) < x) (fact1 : x < (1 : ℝ)) : x < Real.sqrt x
axiom sqrt_0 : Real.sqrt (0 : ℝ) = (0 : ℝ)
axiom sqrt_1 : Real.sqrt (1 : ℝ) = (1 : ℝ)
end Square
