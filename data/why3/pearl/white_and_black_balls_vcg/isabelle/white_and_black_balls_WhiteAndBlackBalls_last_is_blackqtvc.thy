theory white_and_black_balls_WhiteAndBlackBalls_last_is_blackqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem last_is_black'vc:
  fixes b0 :: "int"
  fixes w0 :: "int"
  assumes fact0: "(0 :: int) \<le> b0"
  assumes fact1: "(0 :: int) \<le> w0"
  assumes fact2: "(1 :: int) \<le> b0 + w0"
  shows "(0 :: int) \<le> b0"
  and "(0 :: int) \<le> w0"
  and "(1 :: int) \<le> b0 + w0"
  and "\<forall>(w :: int) (b :: int). ((0 :: int) \<le> b \<and> (0 :: int) \<le> w \<and> (1 :: int) \<le> b + w) \<and> (odd b \<longleftrightarrow> odd b0) \<longrightarrow> (if (2 :: int) \<le> b + w then (\<exists>(x :: int) (y :: int). (0 :: int) \<le> x \<and> (0 :: int) \<le> y \<and> x + y = (2 :: int) \<and> x \<le> b \<and> y \<le> w) \<and> (\<forall>(x :: int) (y :: int). (0 :: int) \<le> x \<and> (0 :: int) \<le> y \<and> x + y = (2 :: int) \<and> x \<le> b \<and> y \<le> w \<longrightarrow> (\<forall>(o1 :: bool). (if x = (0 :: int) then o1 = True else o1 = (if y = (0 :: int) then True else False)) \<longrightarrow> (if o1 = True then ((0 :: int) \<le> b + w \<and> b - x + (w - y + (1 :: int)) < b + w) \<and> ((0 :: int) \<le> b - x \<and> (0 :: int) \<le> w - y + (1 :: int) \<and> (1 :: int) \<le> b - x + (w - y + (1 :: int))) \<and> (odd (b - x) \<longleftrightarrow> odd b0) else ((0 :: int) \<le> b + w \<and> b - x + (1 :: int) + (w - y) < b + w) \<and> ((0 :: int) \<le> b - x + (1 :: int) \<and> (0 :: int) \<le> w - y \<and> (1 :: int) \<le> b - x + (1 :: int) + (w - y)) \<and> (odd (b - x + (1 :: int)) \<longleftrightarrow> odd b0)))) else (0 :: int) < b \<longleftrightarrow> odd b0)"
  sorry
end
