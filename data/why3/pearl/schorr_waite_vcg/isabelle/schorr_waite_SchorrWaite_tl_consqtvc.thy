theory schorr_waite_SchorrWaite_tl_consqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  loc
consts null :: "loc"
typedecl  stacknodes
definition not_in_stack :: "loc \<Rightarrow> loc list \<Rightarrow> _"
  where "not_in_stack n s \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> \<not>n = s ! nat i)" for n s
theorem tl_cons'vc:
  fixes s2 :: "loc list"
  assumes fact0: "(0 :: int) < int (length s2)"
  shows "s2 = Cons (s2 ! (0 :: nat)) (drop (1 :: nat) s2)"
  sorry
end
