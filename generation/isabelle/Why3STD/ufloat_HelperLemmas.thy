theory ufloat_HelperLemmas
  imports "NTP4Verif.NTP4Verif" real_Sum
begin
axiomatization where log_1_minus_x:   "ln ((1 :: Real.real) + x) \<le> -ln ((1 :: Real.real) - x)"
 if "(0 :: Real.real) \<le> abs x"
 and "abs x < (1 :: Real.real)"
  for x :: "real"
axiomatization where log2_1_minus_x:   "log (2) ((1 :: Real.real) + x) \<le> -log (2) ((1 :: Real.real) - x)"
 if "(0 :: Real.real) \<le> abs x"
 and "abs x < (1 :: Real.real)"
  for x :: "real"
axiomatization where log10_1_minus_x:   "log (10) ((1 :: Real.real) + x) \<le> -log (10) ((1 :: Real.real) - x)"
 if "(0 :: Real.real) \<le> abs x"
 and "abs x < (1 :: Real.real)"
  for x :: "real"
axiomatization where sin_of_approx:   "abs (sin x - sin y) \<le> abs (x - y)"
  for x :: "real"
  and y :: "real"
axiomatization where cos_of_approx:   "abs (cos x - cos y) \<le> abs (x - y)"
  for x :: "real"
  and y :: "real"
end
