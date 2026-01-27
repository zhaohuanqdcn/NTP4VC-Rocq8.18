theory bitvector_examples_Hackers_delight_RS_right
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem RS_right:
  fixes x :: "32 word"
  shows "(x >> unat (1 :: 32 word)) OR (x << unat (31 :: 32 word)) = word_rotr_bv x (1 :: 32 word)"
  sorry
end
