theory lineardecision_LinearDecisionRational_Comm
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/lineardecision_RationalCoeffs"
begin
theorem Comm:
  fixes x :: "real"
  fixes y :: "real"
  shows "x + y = y + x"
  sorry
end
