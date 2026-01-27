theory cursor_Cursor
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a cursor
consts visited :: "'a cursor \<Rightarrow> 'a list"
consts permitted :: "'a cursor \<Rightarrow> bool"
axiomatization where permitted_empty:   "permitted c"
 if "visited c = ([] :: 'a list)"
  for c :: "'a cursor"
consts complete :: "'a cursor \<Rightarrow> bool"
end
