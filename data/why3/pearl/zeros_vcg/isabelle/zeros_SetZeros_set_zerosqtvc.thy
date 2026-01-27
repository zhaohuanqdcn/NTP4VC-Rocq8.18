theory zeros_SetZeros_set_zerosqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem set_zeros'vc:
  fixes a :: "int list"
  shows "let o1 :: int = int (length a) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> a ! nat j = (0 :: int)) \<and> (\<forall>(a1 :: int list). length a1 = length a \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> a1 ! nat j = (0 :: int)) \<longrightarrow> ((0 :: int) \<le> i \<and> i < int (length a1)) \<and> (length (a1[nat i := 0 :: int]) = length a1 \<longrightarrow> nth (a1[nat i := 0 :: int]) o nat = (nth a1 o nat)(i := 0 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i + (1 :: int) \<longrightarrow> a1[nat i := 0 :: int] ! nat j = (0 :: int)))) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < o1 + (1 :: int) \<longrightarrow> a1 ! nat j = (0 :: int)) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length a1) \<longrightarrow> a1 ! nat j = (0 :: int))))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < int (length a) \<longrightarrow> a ! nat j = (0 :: int)))"
  sorry
end
