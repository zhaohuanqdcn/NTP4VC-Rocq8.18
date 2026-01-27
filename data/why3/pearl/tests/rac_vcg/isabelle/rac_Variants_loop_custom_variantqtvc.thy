theory rac_Variants_loop_custom_variantqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "Why3STD.relations_WellFounded"
begin
definition p :: "int \<Rightarrow> int \<Rightarrow> _"
  where "p i i_old \<longleftrightarrow> i_old \<le> (2 :: int) \<and> i_old < i" for i i_old
consts p_closure :: "int \<Rightarrow> int \<Rightarrow> bool"
axiomatization where p_closure_def:   "p_closure y y1 = True \<longleftrightarrow> p y y1"
  for y :: "int"
  and y1 :: "int"
theorem loop_custom_variant'vc:
  fixes i :: "int"
  shows "if (0 :: int) \<le> i then p ((2 :: int) - (i - (1 :: int))) ((2 :: int) - i) \<and> acc p_closure ((2 :: int) - i) else \<forall>(i1 :: int). -(1 :: int) \<le> i1 \<longrightarrow> p ((2 :: int) - (i1 - (1 :: int))) ((2 :: int) - i1) \<and> acc p_closure ((2 :: int) - i1)"
  sorry
end
