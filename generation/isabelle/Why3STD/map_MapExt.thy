theory map_MapExt
  imports "NTP4Verif.NTP4Verif"
begin
definition infix_eqeq :: "('a \<Rightarrow> 'b) \<Rightarrow> ('a \<Rightarrow> 'b) \<Rightarrow> _"
  where "infix_eqeq m1 m2 \<longleftrightarrow> (\<forall>(x :: 'a). m1 x = m2 x)" for m1 m2
axiomatization where extensionality:   "m1 = m2"
 if "infix_eqeq m1 m2"
  for m1 :: "'a \<Rightarrow> 'b"
  and m2 :: "'a \<Rightarrow> 'b"
end
