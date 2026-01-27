theory verifythis_2018_le_rouge_et_le_noir_2_Top_coneqtvc
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
theorem cone'vc:
  fixes x :: "'a"
  shows "let o1 :: 'a fset = finsert x (fempty :: 'a fset) in (1 :: int) = int (fcard o1) \<and> (\<forall>(result :: 'a cardinal). card result = (1 :: int) \<and> cset result = o1 \<longrightarrow> cset result = finsert x (fempty :: 'a fset) \<and> card result = (1 :: int))"
  sorry
end
