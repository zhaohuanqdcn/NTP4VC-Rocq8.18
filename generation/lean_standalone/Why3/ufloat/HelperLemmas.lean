namespace HelperLemmas
axiom log_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.log ((1 : ℝ) + x) ≤ -Real.log ((1 : ℝ) - x)
axiom log2_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 2 ((1 : ℝ) + x) ≤ -Real.logb 2 ((1 : ℝ) - x)
axiom log10_1_minus_x (x : ℝ) (fact0 : (0 : ℝ) ≤ abs x) (fact1 : abs x < (1 : ℝ)) : Real.logb 10 ((1 : ℝ) + x) ≤ -Real.logb 10 ((1 : ℝ) - x)
axiom sin_of_approx (x : ℝ) (y : ℝ) : abs (Real.sin x - Real.sin y) ≤ abs (x - y)
axiom cos_of_approx (x : ℝ) (y : ℝ) : abs (Real.cos x - Real.cos y) ≤ abs (x - y)
end HelperLemmas
