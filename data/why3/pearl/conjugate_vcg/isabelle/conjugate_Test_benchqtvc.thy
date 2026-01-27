theory conjugate_Test_benchqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./conjugate_Conjugate"
begin
theorem bench'vc:
  fixes a :: "int list"
  assumes fact0: "(4 :: int) \<le> int (length a)"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) < int (length a)"
  and "a ! (0 :: nat) = (4 :: int) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) < int (length a)) \<and> (a ! (1 :: nat) = (3 :: int) \<longrightarrow> ((0 :: int) \<le> (2 :: int) \<and> (2 :: int) < int (length a)) \<and> (a ! (2 :: nat) = (1 :: int) \<longrightarrow> (0 :: int) \<le> (3 :: int) \<and> (3 :: int) < int (length a)))"
  sorry
end
