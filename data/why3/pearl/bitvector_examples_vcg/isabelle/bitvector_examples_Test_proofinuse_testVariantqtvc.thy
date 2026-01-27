theory bitvector_examples_Test_proofinuse_testVariantqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref"
begin
typedecl  bitvec8
typedecl  bitvec64
theorem testVariant'vc:
  fixes i :: "32 word"
  assumes fact0: "i \<ge> (2 :: 32 word)"
  shows "(0 :: int) \<le> uint i"
  and "uint (i >> unat (2 :: 32 word)) < uint i"
  sorry
end
