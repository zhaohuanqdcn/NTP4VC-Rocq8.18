theory sumrange_ExtraLemmas_sum_frameqtvc
  imports "NTP4Verif.NTP4Verif" "./sumrange_ArraySum"
begin
theorem sum_frame'vc:
  fixes i :: "int"
  fixes j :: "int"
  fixes a1 :: "int list"
  fixes a2 :: "int list"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i \<le> j"
  assumes fact2: "j \<le> int (length a1)"
  assumes fact3: "j \<le> int (length a2)"
  assumes fact4: "\<forall>(k :: int). i \<le> k \<and> k < j \<longrightarrow> a1 ! nat k = a2 ! nat k"
  shows "sum a1 i j = sum a2 i j"
  sorry
end
