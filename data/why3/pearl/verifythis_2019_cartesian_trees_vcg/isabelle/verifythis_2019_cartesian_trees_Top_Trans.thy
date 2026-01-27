theory verifythis_2019_cartesian_trees_Top_Trans
  imports "NTP4Verif.NTP4Verif" "Why3STD.exn_Exn"
begin
theorem Trans:
  fixes y :: "int"
  fixes x :: "int"
  fixes z :: "int"
  assumes fact0: "y \<le> x"
  assumes fact1: "z \<le> y"
  shows "z \<le> x"
  sorry
end
