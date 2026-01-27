theory dyck_Check_same_prefixqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./dyck_Dyck"
begin
definition fall :: "paren list \<Rightarrow> paren list \<Rightarrow> _"
  where "fall p s \<longleftrightarrow> dyck p \<and> (case s of Cons L _ \<Rightarrow> False | _ \<Rightarrow> True)" for p s
theorem same_prefix'vc:
  fixes p :: "paren list"
  fixes s :: "paren list"
  fixes s2 :: "paren list"
  assumes fact0: "p @ s = p @ s2"
  shows "s = s2"
  sorry
end
