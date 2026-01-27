theory queens_bv_NQueensBits_test8qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "./queens_bv_S" "./queens_bv_Solution" "./queens_bv_BitsSpec"
begin
theorem test8'vc:
  assumes fact0: "n = (8 :: int)"
  shows "let o1 :: 32 word = w32_of_int (8 :: int) in uint o1 = n \<and> o1 \<le> w32_size_bv"
  sorry
end
