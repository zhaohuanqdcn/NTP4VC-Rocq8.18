theory amortization_Top_queueqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  elt
theorem queue'vc:
  shows "\<exists>(size :: int) (credits :: int). (0 :: int) \<le> size \<and> (0 :: int) \<le> credits \<and> credits \<le> size"
  sorry
end
