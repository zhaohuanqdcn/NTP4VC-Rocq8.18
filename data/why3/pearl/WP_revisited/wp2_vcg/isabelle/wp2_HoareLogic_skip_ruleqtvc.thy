theory wp2_HoareLogic_skip_ruleqtvc
  imports "NTP4Verif.NTP4Verif" "../../lib/isabelle/wp2_Imp"
begin
theorem skip_rule'vc:
  fixes q :: "fmla"
  shows "valid_triple q Sskip q"
  sorry
end
