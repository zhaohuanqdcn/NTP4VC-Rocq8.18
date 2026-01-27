theory isqrt_von_neumann_VonNeumann32_sqr_add2qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
definition sqr :: "32 word \<Rightarrow> 32 word"
  where "sqr x = x * x" for x
definition is_pow2 :: "32 word \<Rightarrow> 32 word \<Rightarrow> _"
  where "is_pow2 x n \<longleftrightarrow> x AND ((1 :: 32 word) << unat n) - (1 :: 32 word) = (0 :: 32 word)" for x n
theorem sqr_add2'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  shows "sqr (x + y) = sqr x + y * ((2 :: 32 word) * x + y)"
  sorry
end
