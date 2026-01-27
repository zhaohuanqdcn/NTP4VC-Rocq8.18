theory rac_PolyRefContracts_test2_auxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem test2_aux'vc:
  fixes argref :: "'a"
  fixes argx :: "'a"
  fixes argy :: "'a"
  assumes fact0: "\<not>argref = argx"
  shows "argx = argy"
  sorry
end
