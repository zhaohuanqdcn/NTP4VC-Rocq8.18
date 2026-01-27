theory longest_increasing_subsequence_Spec
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
consts lt :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Trans:   "lt x z"
 if "lt x y"
 and "lt y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Asymm:   "\<not>lt y x"
 if "lt x y"
  for x :: "elt"
  and y :: "elt"
axiomatization where Trichotomy:   "lt x y \<or> lt y x \<or> x = y"
  for x :: "elt"
  and y :: "elt"
definition iss :: "int list \<Rightarrow> elt list \<Rightarrow> _"
  where "iss s w \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> (0 :: int) \<le> s ! nat i \<and> s ! nat i < int (length w)) \<and> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < j \<and> j < int (length s) \<longrightarrow> s ! nat i < s ! nat j \<and> lt (w ! nat (s ! nat i)) (w ! nat (s ! nat j)))" for s w
definition liss :: "int list \<Rightarrow> elt list \<Rightarrow> _"
  where "liss s w \<longleftrightarrow> iss s w \<and> (\<forall>(s' :: int list). iss s' w \<longrightarrow> length s' \<le> length s)" for s w
end
