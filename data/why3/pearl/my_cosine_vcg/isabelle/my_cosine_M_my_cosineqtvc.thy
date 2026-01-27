theory my_cosine_M_my_cosineqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.floating_point_Rounding" "Why3STD.floating_point_SingleFormat" "Why3STD.floating_point_Single"
begin
theorem my_cosine'vc:
  fixes x :: "single"
  fixes o1 :: "single"
  assumes fact0: "abs (value x) \<le> (1 :: Real.real) / (32)"
  assumes fact1: "value o1 = (1 :: Real.real) / (2)"
  shows "no_overflow NearestTiesToEven (value x * value x)"
  and "\<forall>(o2 :: single). value o2 = round NearestTiesToEven (value x * value x) \<longrightarrow> no_overflow NearestTiesToEven (value o2 * value o1) \<and> (\<forall>(o3 :: single). value o3 = round NearestTiesToEven (value o2 * value o1) \<longrightarrow> (\<forall>(o4 :: single). value o4 = (1 :: Real.real) \<longrightarrow> no_overflow NearestTiesToEven (value o4 - value o3) \<and> (\<forall>(result :: single). value result = round NearestTiesToEven (value o4 - value o3) \<longrightarrow> abs (value result - cos (value x)) \<le> (1 :: Real.real) / (8388608))))"
  sorry
end
