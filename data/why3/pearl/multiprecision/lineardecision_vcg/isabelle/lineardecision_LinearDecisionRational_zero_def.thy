theory lineardecision_LinearDecisionRational_zero_def
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "../../lib/isabelle/lineardecision_RationalCoeffs"
begin
axiomatization where sub_def:   "a1 - a2 = a1 + -a2"
  for a1 :: "real"
  and a2 :: "real"
typedecl  vars
theorem zero_def:
  fixes y :: "int \<Rightarrow> real"
  shows "rinterp (0 :: int, 1 :: int) y = (0 :: Real.real)"
  sorry
end
