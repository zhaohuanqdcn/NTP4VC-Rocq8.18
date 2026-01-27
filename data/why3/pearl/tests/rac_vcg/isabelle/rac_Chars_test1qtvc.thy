theory rac_Chars_test1qtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts char'int :: "char \<Rightarrow> int"
definition char'eq :: "char \<Rightarrow> char \<Rightarrow> _"
  where "char'eq a b \<longleftrightarrow> char'int a = char'int b" for a b
axiomatization where char'inj:   "a = b"
 if "char'eq a b"
  for a :: "char"
  and b :: "char"
theorem test1'vc:
  shows "True"
  sorry
end
