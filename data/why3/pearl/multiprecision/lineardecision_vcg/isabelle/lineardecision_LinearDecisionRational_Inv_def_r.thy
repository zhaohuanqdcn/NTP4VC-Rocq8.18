theory lineardecision_LinearDecisionRational_Inv_def_r
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/lineardecision_RationalCoeffs"
begin
theorem Inv_def_r:
  fixes x :: "real"
  shows "x + -x = (0 :: Real.real)"
  sorry
end
