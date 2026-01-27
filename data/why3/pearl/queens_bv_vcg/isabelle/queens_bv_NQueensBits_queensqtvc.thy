theory queens_bv_NQueensBits_queensqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "./queens_bv_S" "./queens_bv_Solution" "./queens_bv_BitsSpec"
begin
theorem queens'vc:
  fixes q :: "32 word"
  fixes o1 :: "t"
  fixes o2 :: "t"
  fixes col :: "int \<Rightarrow> int"
  fixes sol1 :: "int \<Rightarrow> int \<Rightarrow> int"
  assumes fact0: "uint q = n"
  assumes fact1: "q \<le> w32_size_bv"
  assumes fact2: "mdl o1 = fempty"
  assumes fact3: "mdl o2 = fempty"
  shows "q \<le> (32 :: 32 word)"
  and "\<forall>(o3 :: t). mdl o3 = Ico_fset_int (0 :: int) (uint q) \<longrightarrow> (n \<le> (32 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) + int (fcard (mdl o3)) = n \<and> (0 :: int) \<le> (0 :: int) \<and> (\<forall>(i :: int). i |\<in>| mdl o3 \<longleftrightarrow> ((0 :: int) \<le> i \<and> i < n) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>col j = i)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (32 :: int) \<longrightarrow> \<not>i |\<in>| mdl o2 \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>i - col j = (0 :: int) - j)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (32 :: int) \<longrightarrow> \<not>i |\<in>| mdl o1 \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>i - col j = j - (0 :: int))) \<and> partial_solution (0 :: int) col) \<and> (\<forall>(s :: int) (sol :: int \<Rightarrow> int \<Rightarrow> int) (col1 :: int \<Rightarrow> int). let result :: int = s - (0 :: int) in (0 :: int) \<le> s - (0 :: int) \<and> queens_bv_Solution.sorted sol (0 :: int) s \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < s \<longrightarrow> partial_solution n (sol i) \<and> eq_prefix col1 (sol i) (0 :: int)) \<and> (\<forall>(u :: int \<Rightarrow> int). partial_solution n u \<and> eq_prefix col1 u (0 :: int) \<longrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < s) \<and> eq_prefix u (sol i) n)) \<and> eq_prefix col col1 (0 :: int) \<and> eq_prefix sol1 sol (0 :: int) \<longrightarrow> result = s \<and> queens_bv_Solution.sorted sol (0 :: int) s \<and> (\<forall>(u :: int \<Rightarrow> int). partial_solution n u \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < result) \<and> eq_prefix u (sol i) n)))"
  sorry
end
