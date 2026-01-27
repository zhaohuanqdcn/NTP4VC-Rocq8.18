theory isqrt_von_neumann_VonNeumann64_sqr_add2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
definition sqr :: "64 word \<Rightarrow> 64 word"
  where "sqr x = x * x" for x
definition is_pow2 :: "64 word \<Rightarrow> 64 word \<Rightarrow> _"
  where "is_pow2 x n \<longleftrightarrow> x AND ((1 :: 64 word) << unat n) - (1 :: 64 word) = (0 :: 64 word)" for x n
theorem sqr_add2'vc:
  fixes x :: "64 word"
  fixes y :: "64 word"
  shows "sqr (x + y) = sqr x + y * ((2 :: 64 word) * x + y)"
  sorry
end
