theory verifythis_2018_le_rouge_et_le_noir_2_Top_disjoint_unionqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition bijection :: "'a fset \<Rightarrow> ('b \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> 'b) \<Rightarrow> ('b \<Rightarrow> 'a) \<Rightarrow> _"
  where "bijection p q f g \<longleftrightarrow> (\<forall>(x :: 'a). x |\<in>| p \<longrightarrow> q (f x) = True \<and> g (f x) = x) \<and> (\<forall>(x :: 'b). q x = True \<longrightarrow> g x |\<in>| p \<and> f (g x) = x)" for p q f g
theorem disjoint_union'vc:
  fixes p :: "'a fset"
  fixes q :: "'a fset"
  assumes fact0: "\<forall>(x :: 'a). \<not>(x |\<in>| p \<and> x |\<in>| q)"
  shows "int (fcard (p |\<union>| q)) = int (fcard p) + int (fcard q)"
  sorry
end
