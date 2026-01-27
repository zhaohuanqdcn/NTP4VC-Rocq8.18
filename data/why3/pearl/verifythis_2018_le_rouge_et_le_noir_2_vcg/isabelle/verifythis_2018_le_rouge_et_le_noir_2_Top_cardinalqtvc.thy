theory verifythis_2018_le_rouge_et_le_noir_2_Top_cardinalqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition bijection :: "'a fset \<Rightarrow> ('b \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> 'b) \<Rightarrow> ('b \<Rightarrow> 'a) \<Rightarrow> _"
  where "bijection p q f g \<longleftrightarrow> (\<forall>(x :: 'a). x |\<in>| p \<longrightarrow> q (f x) = True \<and> g (f x) = x) \<and> (\<forall>(x :: 'b). q x = True \<longrightarrow> g x |\<in>| p \<and> f (g x) = x)" for p q f g
theorem cardinal'vc:
  shows "(0 :: int) = int (fcard (fempty :: 'a fset))"
  sorry
end
