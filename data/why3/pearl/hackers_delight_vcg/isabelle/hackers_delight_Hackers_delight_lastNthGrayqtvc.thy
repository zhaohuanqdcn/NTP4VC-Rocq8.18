theory hackers_delight_Hackers_delight_lastNthGrayqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.int_NumOf" "./hackers_delight_Utils"
begin
definition validAscii :: "32 word \<Rightarrow> _"
  where "validAscii b \<longleftrightarrow> (take_bit (unat (0 :: 32 word)) (hackers_delight_Utils.count b) \<noteq> (0)) = False" for b
definition toGray :: "32 word \<Rightarrow> 32 word"
  where "toGray bv = bv XOR (bv >> unat (1 :: 32 word))" for bv
definition fromGray :: "32 word \<Rightarrow> 32 word"
  where "fromGray gr = (let b :: 32 word = gr XOR (gr >> unat (1 :: 32 word)); b1 :: 32 word = b XOR (b >> unat (2 :: 32 word)); b2 :: 32 word = b1 XOR (b1 >> unat (4 :: 32 word)); b3 :: 32 word = b2 XOR (b2 >> unat (8 :: 32 word)) in b3 XOR (b3 >> unat (16 :: 32 word)))" for gr
theorem lastNthGray'vc:
  fixes b :: "32 word"
  shows "(take_bit (unat (31 :: 32 word)) (toGray b) \<noteq> (0)) = True \<longleftrightarrow> (take_bit (unat (31 :: 32 word)) b \<noteq> (0)) = True"
  sorry
end
