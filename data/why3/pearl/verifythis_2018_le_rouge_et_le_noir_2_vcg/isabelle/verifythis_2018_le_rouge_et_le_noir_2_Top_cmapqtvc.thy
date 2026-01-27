theory verifythis_2018_le_rouge_et_le_noir_2_Top_cmapqtvc
  imports "NTP4Verif.NTP4Verif"
begin
definition bijection :: "'a fset \<Rightarrow> ('b \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> 'b) \<Rightarrow> ('b \<Rightarrow> 'a) \<Rightarrow> _"
  where "bijection p q f g \<longleftrightarrow> (\<forall>(x :: 'a). x |\<in>| p \<longrightarrow> q (f x) = True \<and> g (f x) = x) \<and> (\<forall>(x :: 'b). q x = True \<longrightarrow> g x |\<in>| p \<and> f (g x) = x)" for p q f g
typedecl 'a cardinal
consts card :: "'a cardinal \<Rightarrow> int"
consts cset :: "'a cardinal \<Rightarrow> 'a fset"
axiomatization where cardinal'invariant:   "card self = int (fcard (cset self))"
  for self :: "'a cardinal"
definition cardinal'eq :: "'a cardinal \<Rightarrow> 'a cardinal \<Rightarrow> _"
  where "cardinal'eq a b \<longleftrightarrow> card a = card b \<and> cset a = cset b" for a b
axiomatization where cardinal'inj:   "a = b"
 if "cardinal'eq a b"
  for a :: "'a cardinal"
  and b :: "'a cardinal"
theorem cmap'vc:
  fixes i :: "'a cardinal"
  fixes q :: "'b \<Rightarrow> bool"
  fixes f :: "'a \<Rightarrow> 'b"
  fixes g :: "'b \<Rightarrow> 'a"
  assumes fact0: "bijection (cset i) q f g"
  shows "let o1 :: 'a fset = cset i in bijection o1 q f g \<and> (\<forall>(o2 :: 'b fset). (\<forall>(x :: 'b). q x = True \<longleftrightarrow> x |\<in>| o2) \<and> fcard o1 = fcard o2 \<longrightarrow> (let o3 :: int = card i in o3 = int (fcard o2) \<and> (\<forall>(result :: 'b cardinal). card result = o3 \<and> cset result = o2 \<longrightarrow> (\<forall>(x :: 'b). x |\<in>| cset result \<longleftrightarrow> q x = True) \<and> card result = card i)))"
  sorry
end
