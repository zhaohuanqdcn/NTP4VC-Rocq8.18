theory pigeon_Pigeonhole
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where pigeonhole:   "\<exists>(i1 :: int) (i2 :: int). ((0 :: int) \<le> i1 \<and> i1 < i2 \<and> i2 < n) \<and> f i1 = f i2"
 if "(0 :: int) \<le> m"
 and "m < n"
 and "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> f i \<and> f i < m"
  for m :: "int"
  and n :: "int"
  and f :: "int \<Rightarrow> int"
end
