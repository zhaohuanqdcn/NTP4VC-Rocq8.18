theory ropes_MyString_emptyqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts dummy_char :: "char"
typedecl  char_string
consts length :: "char_string \<Rightarrow> int"
axiomatization where length'spec:   "(0 :: int) \<le> length x"
  for x :: "char_string"
consts mixfix_lbrb :: "char_string \<Rightarrow> int \<Rightarrow> char"
theorem empty'vc:
  shows "True"
  sorry
end
