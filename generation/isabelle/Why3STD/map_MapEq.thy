theory map_MapEq
  imports "NTP4Verif.NTP4Verif"
begin
definition map_eq_sub :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "map_eq_sub a1 a2 l u \<longleftrightarrow> (\<forall>(i :: int). l \<le> i \<and> i < u \<longrightarrow> a1 i = a2 i)" for a1 a2 l u
end
