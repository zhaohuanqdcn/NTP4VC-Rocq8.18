theory bitvector_examples_Test_imperial_violet_to_int_ultqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem to_int_ult'vc:
  fixes b :: "32 word"
  fixes c :: "32 word"
  assumes fact0: "b < c"
  shows "uint b < uint c"
  sorry
end
