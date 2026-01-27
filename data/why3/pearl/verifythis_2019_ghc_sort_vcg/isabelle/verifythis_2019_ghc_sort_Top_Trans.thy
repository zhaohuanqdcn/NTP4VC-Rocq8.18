theory verifythis_2019_ghc_sort_Top_Trans
  imports "NTP4Verif.NTP4Verif" "Why3STD.exn_Exn"
begin
theorem Trans:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  assumes fact0: "x < y"
  assumes fact1: "y < z"
  shows "x < z"
  sorry
end
