theory blocking_semantics5_Syntax_mident_decideqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  "datatype" = TYunit | TYint | TYbool
datatype  "value" = Vvoid | Vint "int" | Vbool "bool"
datatype  operator = Oplus | Ominus | Omult | Ole
typedecl  mident
theorem mident_decide'vc:
  shows "True \<or> \<not>True"
  sorry
end
