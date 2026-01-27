theory bitvector_examples_Hackers_delight_RS_left
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
theorem RS_left:
  fixes x :: "32 word"
  shows "(x << unat (1 :: 32 word)) OR (x >> unat (31 :: 32 word)) = word_rotl_bv x (1 :: 32 word)"
  sorry
end
