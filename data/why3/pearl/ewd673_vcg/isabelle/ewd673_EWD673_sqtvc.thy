theory ewd673_EWD673_sqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem s'vc:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> x"
  assumes fact1: "(0 :: int) \<le> y"
  shows "(0 :: int) \<le> x"
  and "(0 :: int) \<le> y"
  and "\<forall>(y1 :: int) (x1 :: int). (0 :: int) \<le> x1 \<and> (0 :: int) \<le> y1 \<longrightarrow> (if (0 :: int) < x1 then True else True = (if (0 :: int) < y1 then True else False)) \<longrightarrow> (if (0 :: int) < x1 then \<forall>(o1 :: int). (0 :: int) \<le> o1 \<longrightarrow> (if (0 :: int) < o1 then ((0 :: int) \<le> x1 \<and> x1 - (1 :: int) < x1 \<or> x1 = x1 - (1 :: int) \<and> (0 :: int) \<le> y1 \<and> o1 - (1 :: int) < y1) \<and> (0 :: int) \<le> x1 - (1 :: int) \<and> (0 :: int) \<le> o1 - (1 :: int) else ((0 :: int) \<le> x1 \<and> x1 - (1 :: int) < x1 \<or> x1 = x1 - (1 :: int) \<and> (0 :: int) \<le> y1 \<and> o1 < y1) \<and> (0 :: int) \<le> x1 - (1 :: int) \<and> (0 :: int) \<le> o1) else if (0 :: int) < y1 then ((0 :: int) \<le> x1 \<and> x1 < x1 \<or> (0 :: int) \<le> y1 \<and> y1 - (1 :: int) < y1) \<and> (0 :: int) \<le> x1 \<and> (0 :: int) \<le> y1 - (1 :: int) else ((0 :: int) \<le> x1 \<and> x1 < x1 \<or> (0 :: int) \<le> y1 \<and> y1 < y1) \<and> (0 :: int) \<le> x1 \<and> (0 :: int) \<le> y1)"
  sorry
end
