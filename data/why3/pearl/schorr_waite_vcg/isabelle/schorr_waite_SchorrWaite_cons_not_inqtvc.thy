theory schorr_waite_SchorrWaite_cons_not_inqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
typedecl  stacknodes
definition not_in_stack :: "loc \<Rightarrow> loc list \<Rightarrow> _"
  where "not_in_stack n s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> \<not>n = s ! nat i)" for n s
theorem cons_not_in'vc:
  fixes n :: "loc"
  fixes t :: "loc"
  fixes s :: "loc list"
  assumes fact0: "not_in_stack n (Cons t s)"
  shows "not_in_stack n s"
  sorry
end
