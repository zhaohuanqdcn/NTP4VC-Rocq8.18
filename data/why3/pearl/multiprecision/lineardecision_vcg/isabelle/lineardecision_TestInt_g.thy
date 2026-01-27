theory lineardecision_TestInt_g
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "mach.matrix_Matrix63" "Why3STD.debug_Debug" "../../lib/isabelle/lineardecision_RationalCoeffs" "../../lib/isabelle/lineardecision_LinearDecisionRational" "../../lib/isabelle/lineardecision_LinearDecisionInt"
begin
theorem g:
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(3 :: int) * x + (2 :: int) * y = (21 :: int)"
  assumes fact1: "(7 :: int) * x + (4 :: int) * y = (47 :: int)"
  shows "x = (5 :: int)"
  sorry
end
