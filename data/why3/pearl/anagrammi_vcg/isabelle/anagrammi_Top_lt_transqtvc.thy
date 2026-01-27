theory anagrammi_Top_lt_transqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  line
definition perm4 :: "int list \<Rightarrow> _"
  where "perm4 s \<longleftrightarrow> int (length s) = (4 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (4 :: int) \<longrightarrow> (1 :: int) \<le> s ! nat i \<and> s ! nat i \<le> (4 :: int)) \<and> distinct s" for s
definition lt :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "lt s1 s2 \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < (4 :: int)) \<and> s1 ! nat i < s2 ! nat i \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> s1 ! nat j = s2 ! nat j))" for s1 s2
theorem lt_trans'vc:
  fixes s1 :: "int list"
  fixes s2 :: "int list"
  fixes s3 :: "int list"
  assumes fact0: "perm4 s1"
  assumes fact1: "perm4 s2"
  assumes fact2: "perm4 s3"
  assumes fact3: "lt s1 s2"
  assumes fact4: "lt s2 s3"
  shows "lt s1 s3"
  sorry
end
