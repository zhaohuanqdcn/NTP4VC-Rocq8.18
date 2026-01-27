theory lineardecision_LinearDecisionRationalMP_Assoc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.debug_Debug" "../../lib/isabelle/lineardecision_RationalCoeffs" "../../lib/isabelle/lineardecision_MP64Coeffs"
begin
typedecl  coeff
theorem Assoc:
  fixes x :: "real"
  fixes y :: "real"
  fixes z :: "real"
  shows "x + y + z = x + (y + z)"
  sorry
end
