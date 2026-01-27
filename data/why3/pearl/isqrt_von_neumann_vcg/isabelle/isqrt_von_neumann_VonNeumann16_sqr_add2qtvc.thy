theory isqrt_von_neumann_VonNeumann16_sqr_add2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
definition sqr :: "16 word \<Rightarrow> 16 word"
  where "sqr x = x * x" for x
definition is_pow2 :: "16 word \<Rightarrow> 16 word \<Rightarrow> _"
  where "is_pow2 x n \<longleftrightarrow> x AND ((1 :: 16 word) << unat n) - (1 :: 16 word) = (0 :: 16 word)" for x n
theorem sqr_add2'vc:
  fixes x :: "16 word"
  fixes y :: "16 word"
  shows "sqr (x + y) = sqr x + y * ((2 :: 16 word) * x + y)"
  sorry
end
