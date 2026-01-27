theory my_exp_log_ExpLogLemmas_log_combine_errqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem log_combine_err'vc:
  fixes x :: "real"
  fixes b :: "real"
  fixes a :: "real"
  fixes x_approx :: "real"
  assumes fact0: "(0 :: Real.real) < x"
  assumes fact1: "b < x * ((1 :: Real.real) - a)"
  assumes fact2: "abs (x_approx - x) \<le> x * a + b"
  shows "abs (ln x_approx - ln x) \<le> -ln ((1 :: Real.real) - (a + b / x))"
  sorry
end
