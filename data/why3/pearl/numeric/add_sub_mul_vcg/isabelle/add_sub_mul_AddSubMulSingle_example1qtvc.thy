theory add_sub_mul_AddSubMulSingle_example1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.real_Sum" "Why3STD.ieee_float_RoundingMode" "Why3STD.ufloat_USingle" "Why3STD.ufloat_HelperLemmas" "Why3STD.ufloat_USingleLemmas"
begin
theorem example1'vc:
  fixes a :: "usingle"
  fixes b :: "usingle"
  fixes c :: "usingle"
  fixes d :: "usingle"
  shows "abs (to_real (umul (usub (uadd a b) c) d) - (to_real a + to_real b - to_real c) * to_real d) \<le> (31 :: Real.real) / (10) * eps * abs ((abs (to_real a + to_real b) + abs (to_real c)) * to_real d) + eta"
  sorry
end
