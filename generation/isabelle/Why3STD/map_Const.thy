theory map_Const
  imports "NTP4Verif.NTP4Verif"
begin
consts const :: "'b \<Rightarrow> 'a \<Rightarrow> 'b"
axiomatization where const'def:   "(const :: 'b \<Rightarrow> 'a \<Rightarrow> 'b) v x = v"
  for v :: "'b"
  and x :: "'a"
end
