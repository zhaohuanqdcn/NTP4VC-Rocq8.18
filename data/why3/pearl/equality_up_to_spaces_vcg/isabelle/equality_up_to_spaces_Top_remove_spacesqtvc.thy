theory equality_up_to_spaces_Top_remove_spacesqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts space :: "char"
consts eq :: "char \<Rightarrow> char \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y = True \<longleftrightarrow> x = y"
  for x :: "char"
  and y :: "char"
typedecl  char_string
theorem remove_spaces'vc:
  fixes s :: "char list"
  assumes fact0: "\<not>int (length s) = (0 :: int)"
  shows "let o1 :: char = space; o2 :: char = s ! (0 :: nat) in (eq o2 o1 = True \<longleftrightarrow> o2 = o1) \<longrightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> int (length s)) \<and> (0 :: int) \<le> int (length s) \<and> length (drop (1 :: nat) s) < length s"
  sorry
end
