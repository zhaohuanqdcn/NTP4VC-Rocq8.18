theory lineardecision_TestMP_g
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_NumOf" "mach.matrix_Matrix63" "Why3STD.debug_Debug" "../../lib/isabelle/lineardecision_RationalCoeffs" "../../lib/isabelle/lineardecision_MP64Coeffs" "../../lib/isabelle/lineardecision_LinearDecisionRationalMP" "../../lib/isabelle/lineardecision_LinearDecisionIntMP" "../../lib/isabelle/lineardecision_EqPropMP"
begin
theorem g:
  fixes i :: "int"
  fixes x :: "int"
  fixes c :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  shows "((18446744073709551615 :: int) + (1 :: int)) * x + (2 :: int) * ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i (i + (1 :: int)) * c = ((18446744073709551615 :: int) + (1 :: int)) * (x + (2 :: int) * ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i i * c)"
  sorry
end
