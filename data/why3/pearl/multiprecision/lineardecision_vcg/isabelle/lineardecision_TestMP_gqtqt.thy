theory lineardecision_TestMP_gqtqt
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.int_NumOf" "mach.matrix_Matrix63" "Why3STD.debug_Debug" "../../lib/isabelle/lineardecision_RationalCoeffs" "../../lib/isabelle/lineardecision_MP64Coeffs" "../../lib/isabelle/lineardecision_LinearDecisionRationalMP" "../../lib/isabelle/lineardecision_LinearDecisionIntMP" "../../lib/isabelle/lineardecision_EqPropMP"
begin
theorem g'':
  fixes i :: "int"
  fixes r :: "int"
  fixes x :: "int"
  fixes y :: "int"
  fixes l :: "int"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "r + ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i i * (0 :: int) = x + y"
  shows "r + ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i i * l + ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i (i + (1 :: int)) * (0 :: int) = x + ((18446744073709551615 :: int) + (1 :: int)) ^\<^sub>i i * l + y"
  sorry
end
