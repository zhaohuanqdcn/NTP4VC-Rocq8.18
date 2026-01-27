theory schorr_waite_SchorrWaite_tl_stackNodesqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
typedecl  stacknodes
definition not_in_stack :: "loc \<Rightarrow> loc list \<Rightarrow> _"
  where "not_in_stack n s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> \<not>n = s ! nat i)" for n s
theorem tl_stackNodes'vc:
  fixes stack :: "loc list"
  assumes fact0: "(0 :: int) < int (length stack)"
  shows "(0 :: int) \<le> (1 :: int)"
  and "(1 :: int) \<le> int (length stack)"
  and "let result :: loc list = drop (1 :: nat) stack in result = drop (1 :: nat) stack \<and> (\<forall>(n :: loc). not_in_stack n stack \<longrightarrow> not_in_stack n result)"
  sorry
end
