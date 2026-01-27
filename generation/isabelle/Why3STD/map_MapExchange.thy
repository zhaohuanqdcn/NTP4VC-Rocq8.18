theory map_MapExchange
  imports "NTP4Verif.NTP4Verif"
begin
definition exchange :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "exchange a1 a2 l u i j \<longleftrightarrow> (l \<le> i \<and> i < u) \<and> (l \<le> j \<and> j < u) \<and> a1 i = a2 j \<and> a1 j = a2 i \<and> (\<forall>(k :: int). l \<le> k \<and> k < u \<longrightarrow> \<not>k = i \<longrightarrow> \<not>k = j \<longrightarrow> a1 k = a2 k)" for a1 a2 l u i j
axiomatization where exchange_set:   "exchange a (a(j := a i, i := a j)) l u i j"
 if "l \<le> i"
 and "i < u"
 and "l \<le> j"
 and "j < u"
  for l :: "int"
  and i :: "int"
  and u :: "int"
  and j :: "int"
  and a :: "int \<Rightarrow> 'a"
end
