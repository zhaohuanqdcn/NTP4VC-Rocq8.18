theory lineardecision_LinearDecisionRationalMP_NonTrivialRing
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.debug_Debug" "../../lib/isabelle/lineardecision_RationalCoeffs" "../../lib/isabelle/lineardecision_MP64Coeffs"
begin
typedecl  coeff
theorem NonTrivialRing:
  shows "\<not>(0 :: Real.real) = (1 :: Real.real)"
  sorry
end
