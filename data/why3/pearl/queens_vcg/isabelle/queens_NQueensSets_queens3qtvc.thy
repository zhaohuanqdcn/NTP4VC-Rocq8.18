theory queens_NQueensSets_queens3qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./queens_S" "./queens_Solution"
begin
theorem queens3'vc:
  fixes o1 :: "int FSet.fset"
  fixes o2 :: "int FSet.fset"
  fixes o3 :: "int FSet.fset"
  fixes col :: "int \<Rightarrow> int"
  fixes sol1 :: "int \<Rightarrow> int \<Rightarrow> int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "o1 = fempty"
  assumes fact2: "int (fcard o1) = (0 :: int)"
  assumes fact3: "o2 = fempty"
  assumes fact4: "int (fcard o2) = (0 :: int)"
  assumes fact5: "o3 = Ico_fset_int (0 :: int) n"
  assumes fact6: "int (fcard o3) = (if (0 :: int) \<le> n then n - (0 :: int) else (0 :: int))"
  shows "(0 :: int) \<le> (0 :: int)"
  and "(0 :: int) + int (fcard o3) = n"
  and "(0 :: int) \<le> (0 :: int)"
  and "\<forall>(i :: int). i |\<in>| o3 \<longleftrightarrow> ((0 :: int) \<le> i \<and> i < n) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>col j = i)"
  and "\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> \<not>i |\<in>| o2 \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>col j = i + j - (0 :: int))"
  and "\<forall>(i :: int). (0 :: int) \<le> i \<longrightarrow> \<not>i |\<in>| o1 \<longleftrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> \<not>col j = i + (0 :: int) - j)"
  and "partial_solution (0 :: int) col"
  and "\<forall>(s :: int) (sol :: int \<Rightarrow> int \<Rightarrow> int) (col1 :: int \<Rightarrow> int). let result :: int = s - (0 :: int) in (0 :: int) \<le> s - (0 :: int) \<and> queens_Solution.sorted sol (0 :: int) s \<and> (\<forall>(t :: int \<Rightarrow> int). partial_solution n t \<and> eq_prefix col1 t (0 :: int) \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < s) \<and> eq_prefix t (sol i) n)) \<and> eq_prefix col col1 (0 :: int) \<and> eq_prefix sol1 sol (0 :: int) \<longrightarrow> result = s \<and> queens_Solution.sorted sol (0 :: int) s \<and> (\<forall>(t :: int \<Rightarrow> int). partial_solution n t \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < result) \<and> eq_prefix t (sol i) n))"
  sorry
end
