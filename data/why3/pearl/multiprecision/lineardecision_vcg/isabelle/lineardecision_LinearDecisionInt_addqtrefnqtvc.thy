theory lineardecision_LinearDecisionInt_addqtrefnqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  t' = IC "int" | Error
definition interp_id :: "t' \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp_id t x_v = (case t of IC i \<Rightarrow> i | Error \<Rightarrow> (0 :: int))" for t x_v
axiomatization where sub_def:   "a1 - a2 = a1 + -a2"
  for a1 :: "int"
  and a2 :: "int"
typedecl  vars
axiomatization where zero_def:   "interp_id (IC (0 :: int)) y = (0 :: int)"
  for y :: "int \<Rightarrow> int"
axiomatization where one_def:   "interp_id (IC (1 :: int)) y = (1 :: int)"
  for y :: "int \<Rightarrow> int"
theorem add'refn'vc:
  shows "True"
  sorry
end
