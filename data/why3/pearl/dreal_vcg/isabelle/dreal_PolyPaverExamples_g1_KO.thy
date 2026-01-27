theory dreal_PolyPaverExamples_g1_KO
  imports "NTP4Verif.NTP4Verif"
begin
theorem g1_KO:
  fixes a :: "real"
  fixes b :: "real"
  assumes fact0: "-(10 :: Real.real) \<le> a"
  assumes fact1: "a \<le> (10 :: Real.real)"
  assumes fact2: "-(10 :: Real.real) \<le> b"
  assumes fact3: "b \<le> (10 :: Real.real)"
  assumes fact4: "a + (1 :: Real.real) / (10) < b"
  shows "(b - a) * exp ((a + b) / (2 :: Real.real)) < exp a - exp b"
  sorry
end
