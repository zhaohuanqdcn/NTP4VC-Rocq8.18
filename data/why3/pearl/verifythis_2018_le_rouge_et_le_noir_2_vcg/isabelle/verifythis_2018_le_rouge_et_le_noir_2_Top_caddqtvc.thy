theory verifythis_2018_le_rouge_et_le_noir_2_Top_caddqtvc
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
theorem cadd'vc:
  fixes i1 :: "'a cardinal"
  fixes i2 :: "'a cardinal"
  assumes fact0: "\<forall>(x :: 'a). \<not>(x |\<in>| cset i1 \<and> x |\<in>| cset i2)"
  shows "let o1 :: 'a fset = cset i2; o2 :: 'a fset = cset i1 in (\<forall>(x :: 'a). \<not>(x |\<in>| o2 \<and> x |\<in>| o1)) \<and> (int (fcard (o2 |\<union>| o1)) = int (fcard o2) + int (fcard o1) \<longrightarrow> (let o3 :: 'a fset = cset i1 |\<union>| cset i2; o4 :: int = card i1 + card i2 in o4 = int (fcard o3) \<and> (\<forall>(result :: 'a cardinal). card result = o4 \<and> cset result = o3 \<longrightarrow> cset result = cset i1 |\<union>| cset i2 \<and> card result = card i1 + card i2)))"
  sorry
end
