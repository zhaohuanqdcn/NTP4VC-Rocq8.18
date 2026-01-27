theory blocking_semantics5_Syntax_decide_is_skipqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  "datatype" = TYunit | TYint | TYbool
datatype  "value" = Vvoid | Vint "int" | Vbool "bool"
datatype  operator = Oplus | Ominus | Omult | Ole
typedecl  mident
typedecl  ident
datatype  "term" = Tvalue "value" | Tvar "ident" | Tderef "mident" | Tbin "term" "operator" "term"
datatype  fmla = Fterm "term" | Fand "fmla" "fmla" | Fnot "fmla" | Fimplies "fmla" "fmla" | Flet "ident" "term" "fmla" | Fforall "ident" "datatype" "fmla"
datatype  stmt = Sskip | Sassign "mident" "term" | Sseq "stmt" "stmt" | Sif "term" "stmt" "stmt" | Sassert "fmla" | Swhile "term" "fmla" "stmt"
theorem decide_is_skip'vc:
  shows "True \<or> \<not>True"
  sorry
end
