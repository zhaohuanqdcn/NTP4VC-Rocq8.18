theory coincidence_count_CoincidenceCount_not_mem_inter_rqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
consts mixfix_lbrb_closure :: "'a list \<Rightarrow> int \<Rightarrow> 'a"
axiomatization where mixfix_lbrb_closure_def:   "mixfix_lbrb_closure y y1 = y ! nat y1"
  for y :: "'a list"
  and y1 :: "int"
definition setof :: "'a list \<Rightarrow> 'a fset"
  where "setof a = mixfix_lbrb_closure a |`| Ico_fset_int (0 :: int) (int (length a))" for a
definition drop :: "'a list \<Rightarrow> int \<Rightarrow> 'a fset"
  where "drop a n = mixfix_lbrb_closure a |`| Ico_fset_int n (int (length a))" for a n
definition increasing :: "int list \<Rightarrow> _"
  where "increasing a \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < int (length a) \<longrightarrow> a ! nat i < a ! nat j)" for a
definition cc :: "int list \<Rightarrow> int list \<Rightarrow> int"
  where "cc a b = int (fcard (setof a |\<inter>| setof b))" for a b
theorem not_mem_inter_r'vc:
  fixes i :: "int"
  fixes a :: "int list"
  fixes s :: "int fset"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < int (length a)"
  assumes fact2: "\<not>a ! nat i |\<in>| s"
  shows "drop a i |\<inter>| s = drop a (i + (1 :: int)) |\<inter>| s"
  sorry
end
