theory bitvector_examples_Test_proofinuse_tttqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
typedecl  bitvec8
typedecl  bitvec64
definition in_range :: "32 word \<Rightarrow> _"
  where "in_range n \<longleftrightarrow> (0 :: 32 word) \<le> n \<and> n \<le> (255 :: 32 word)" for n
definition add_over :: "32 word \<Rightarrow> 32 word \<Rightarrow> _"
  where "add_over x y \<longleftrightarrow> x + y \<ge> x \<and> x + y \<ge> y" for x y
theorem ttt'vc:
  fixes x :: "32 word"
  fixes y :: "32 word"
  fixes i :: "32 word"
  assumes fact0: "add_over x y"
  assumes fact1: "i < x"
  shows "add_over i y"
  sorry
end
