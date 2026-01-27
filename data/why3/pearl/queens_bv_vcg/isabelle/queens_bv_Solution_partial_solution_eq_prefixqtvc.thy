theory queens_bv_Solution_partial_solution_eq_prefixqtvc
  imports "NTP4Verif.NTP4Verif"
begin
consts n :: "int"
typedecl  solution
definition eq_prefix :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> _"
  where "eq_prefix t u i \<longleftrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < i \<longrightarrow> t k = u k)" for t u i
definition partial_solution :: "int \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "partial_solution k s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < k \<longrightarrow> ((0 :: int) \<le> s i \<and> s i < n) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>s i = s j \<and> \<not>s i - s j = i - j \<and> \<not>s i - s j = j - i))" for k s
theorem partial_solution_eq_prefix'vc:
  fixes k :: "int"
  fixes t :: "int \<Rightarrow> int"
  fixes u :: "int \<Rightarrow> int"
  assumes fact0: "partial_solution k t"
  assumes fact1: "eq_prefix t u k"
  shows "partial_solution k u"
  sorry
end
