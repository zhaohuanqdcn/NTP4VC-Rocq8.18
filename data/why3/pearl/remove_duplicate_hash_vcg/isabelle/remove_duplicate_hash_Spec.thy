theory remove_duplicate_hash_Spec
  imports "NTP4Verif.NTP4Verif"
begin
definition appears :: "'a \<Rightarrow> 'a list \<Rightarrow> int \<Rightarrow> _"
  where "appears v a s \<longleftrightarrow> (\<exists>(i :: int). ((0 :: int) \<le> i \<and> i < s) \<and> a ! nat i = v)" for v a s
definition nodup :: "'a list \<Rightarrow> int \<Rightarrow> _"
  where "nodup a s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < s \<longrightarrow> \<not>appears (a ! nat i) a i)" for a s
end
