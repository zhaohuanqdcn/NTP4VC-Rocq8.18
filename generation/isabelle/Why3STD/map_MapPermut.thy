theory map_MapPermut
  imports "NTP4Verif.NTP4Verif"
begin
definition permut :: "(int \<Rightarrow> 'a) \<Rightarrow> (int \<Rightarrow> 'a) \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "permut m1 m2 l u \<longleftrightarrow> (\<forall>(v :: 'a). map_occ v m1 l u = map_occ v m2 l u)" for m1 m2 l u
axiomatization where permut_trans:   "permut a1 a3 l u"
 if "permut a1 a2 l u"
 and "permut a2 a3 l u"
  for a1 :: "int \<Rightarrow> 'a"
  and a2 :: "int \<Rightarrow> 'a"
  and l :: "int"
  and u :: "int"
  and a3 :: "int \<Rightarrow> 'a"
axiomatization where permut_exists:   "\<exists>(j :: int). (l \<le> j \<and> j < u) \<and> a1 j = a2 i"
 if "permut a1 a2 l u"
 and "l \<le> i"
 and "i < u"
  for a1 :: "int \<Rightarrow> 'a"
  and a2 :: "int \<Rightarrow> 'a"
  and l :: "int"
  and u :: "int"
  and i :: "int"
end
