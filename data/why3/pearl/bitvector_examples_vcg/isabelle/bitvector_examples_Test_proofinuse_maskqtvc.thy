theory bitvector_examples_Test_proofinuse_maskqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
typedecl  bitvec8
typedecl  bitvec64
theorem mask'vc:
  fixes x :: "32 word"
  shows "u32_to_u8 ((x AND (4294967040 :: 32 word) OR (1 :: 32 word)) AND (255 :: 32 word)) = (1 :: 8 word)"
  sorry
end
