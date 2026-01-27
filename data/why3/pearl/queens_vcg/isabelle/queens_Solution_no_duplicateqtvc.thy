theory queens_Solution_no_duplicateqtvc
  imports "NTP4Verif.NTP4Verif"
begin
consts n :: "int"
typedecl  solution
definition eq_prefix :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> _"
  where "eq_prefix t u i \<longleftrightarrow> (\<forall>(k :: int). (0 :: int) \<le> k \<and> k < i \<longrightarrow> t k = u k)" for t u i
definition partial_solution :: "int \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "partial_solution k s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < k \<longrightarrow> ((0 :: int) \<le> s i \<and> s i < n) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i \<longrightarrow> \<not>s i = s j \<and> \<not>s i - s j = i - j \<and> \<not>s i - s j = j - i))" for k s
definition lt_sol :: "(int \<Rightarrow> int) \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> _"
  where "lt_sol s1 s2 \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < n) \<and> eq_prefix s1 s2 i \<and> s1 i < s2 i)" for s1 s2
typedecl  solutions
definition sorted :: "(int \<Rightarrow> int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "sorted s a b \<longleftrightarrow> (\<forall>(i :: int) (j :: int). a \<le> i \<and> i < j \<and> j < b \<longrightarrow> lt_sol (s i) (s j))" for s a b
theorem no_duplicate'vc:
  fixes s :: "int \<Rightarrow> int \<Rightarrow> int"
  fixes a :: "int"
  fixes b :: "int"
  fixes i :: "int"
  fixes j :: "int"
  assumes fact0: "sorted s a b"
  assumes fact1: "a \<le> i"
  assumes fact2: "i < j"
  assumes fact3: "j < b"
  shows "\<not>eq_prefix (s i) (s j) n"
  sorry
end
