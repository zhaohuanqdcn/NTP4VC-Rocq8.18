theory map_MapInjection
  imports "NTP4Verif.NTP4Verif"
begin
definition injective :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "injective a n \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> j \<and> j < n \<longrightarrow> \<not>i = j \<longrightarrow> \<not>a i = a j)" for a n
definition surjective :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "surjective a n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (\<exists>(j :: int). ((0 :: int) \<le> j \<and> j < n) \<and> a j = i))" for a n
definition range :: "(int \<Rightarrow> int) \<Rightarrow> int \<Rightarrow> _"
  where "range a n \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> a i \<and> a i < n)" for a n
axiomatization where injective_surjective:   "surjective a n"
 if "injective a n"
 and "range a n"
  for a :: "int \<Rightarrow> int"
  and n :: "int"
axiomatization where injection_occ:   "injective m n \<longleftrightarrow> (\<forall>(v :: int). int (map_occ v m (0 :: int) n) \<le> (1 :: int))"
  for m :: "int \<Rightarrow> int"
  and n :: "int"
end
