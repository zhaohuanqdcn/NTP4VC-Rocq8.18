theory schorr_waite_via_recursion_SchorrWaite_blackqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "./schorr_waite_via_recursion_Memory" "./schorr_waite_via_recursion_GraphShape"
begin
theorem black'vc:
  fixes l :: "loc"
  fixes memo :: "memory"
  assumes fact0: "\<not>l = null"
  shows "\<not>l = null"
  and "\<forall>(result :: bool). (case colors memo l of White \<Rightarrow> result = False | _ \<Rightarrow> result = True) \<longrightarrow> result = True \<longleftrightarrow> black (colors memo l)"
  sorry
end
