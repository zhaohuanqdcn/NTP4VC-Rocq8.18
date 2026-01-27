theory rac_Functions_test3_auxqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem test3_aux'vc:
  fixes y :: "int"
  assumes fact0: "(0 :: int) < y"
  shows "y = (1 :: int)"
  sorry
end
