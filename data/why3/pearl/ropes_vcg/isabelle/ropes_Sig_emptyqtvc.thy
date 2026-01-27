theory ropes_Sig_emptyqtvc
  imports "NTP4Verif.NTP4Verif" "./ropes_MyString"
begin
typedecl  rope
consts string :: "rope \<Rightarrow> char_string"
consts length :: "rope \<Rightarrow> int"
theorem empty'vc:
  shows "True"
  sorry
end
