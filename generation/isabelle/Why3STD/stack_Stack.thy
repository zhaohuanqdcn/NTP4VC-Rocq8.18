theory stack_Stack
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a t
consts elts :: "'a t \<Rightarrow> 'a list"
definition length :: "'a t \<Rightarrow> int"
  where "length s = int (List.length (elts s))" for s
end
