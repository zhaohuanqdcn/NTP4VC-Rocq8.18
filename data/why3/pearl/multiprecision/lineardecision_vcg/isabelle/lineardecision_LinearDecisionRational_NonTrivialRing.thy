theory lineardecision_LinearDecisionRational_NonTrivialRing
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/lineardecision_RationalCoeffs"
begin
theorem NonTrivialRing:
  shows "\<not>(0 :: Real.real) = (1 :: Real.real)"
  sorry
end
