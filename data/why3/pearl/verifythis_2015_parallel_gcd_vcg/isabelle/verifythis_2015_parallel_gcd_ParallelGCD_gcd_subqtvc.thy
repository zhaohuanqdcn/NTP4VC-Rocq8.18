theory verifythis_2015_parallel_gcd_ParallelGCD_gcd_subqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
theorem gcd_sub'vc:
  fixes a :: "int"
  fixes b :: "int"
  shows "gcd a b = gcd a (b - a)"
  sorry
end
