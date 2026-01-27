theory duplets_Duplets_dupletsqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition is_duplet :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "is_duplet a i j \<longleftrightarrow> ((0 :: int) \<le> i \<and> i < j \<and> j < int (length a)) \<and> a ! nat i = a ! nat j" for a i j
definition eq_opt :: "int \<Rightarrow> int option \<Rightarrow> _"
  where "eq_opt x o1 \<longleftrightarrow> (case o1 of None \<Rightarrow> False | Some v \<Rightarrow> v = x)" for x o1
theorem duplets'vc:
  fixes a :: "int list"
  assumes fact0: "(4 :: int) \<le> int (length a)"
  assumes fact1: "\<exists>(i :: int) (j :: int) (k :: int) (l :: int). is_duplet a i j \<and> is_duplet a k l \<and> \<not>a ! nat i = a ! nat k"
  shows "let o1 :: int option = None in ((2 :: int) \<le> int (length a) \<and> (\<exists>(i :: int) (j :: int). is_duplet a i j \<and> \<not>eq_opt (a ! nat i) o1)) \<and> (\<forall>(i :: int) (j :: int). is_duplet a i j \<and> \<not>eq_opt (a ! nat i) o1 \<longrightarrow> (((0 :: int) \<le> j \<and> j < int (length a)) \<and> (2 :: int) \<le> int (length a) \<and> (\<exists>(i1 :: int) (j1 :: int). is_duplet a i1 j1 \<and> \<not>eq_opt (a ! nat i1) (Some (a ! nat j)))) \<and> (\<forall>(result :: int) (result1 :: int). is_duplet a result result1 \<and> \<not>eq_opt (a ! nat result) (Some (a ! nat j)) \<longrightarrow> is_duplet a i j \<and> is_duplet a result result1 \<and> \<not>a ! nat i = a ! nat result))"
  sorry
end
