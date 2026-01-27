theory hackers_delight_Utils
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded"
begin
definition max :: "32 word \<Rightarrow> 32 word \<Rightarrow> 32 word"
  where "max x y = (if x < y then y else x)" for x y
definition min :: "32 word \<Rightarrow> 32 word \<Rightarrow> 32 word"
  where "min x y = (if x < y then x else y)" for x y
definition count :: "32 word \<Rightarrow> 32 word"
  where "count bv = (let x :: 32 word = bv - ((bv >> unat (1 :: 32 word)) AND (1431655765 :: 32 word)); x1 :: 32 word = (x AND (858993459 :: 32 word)) + ((x >> unat (2 :: 32 word)) AND (858993459 :: 32 word)); x2 :: 32 word = x1 + (x1 >> unat (4 :: 32 word)) AND (252645135 :: 32 word); x3 :: 32 word = x2 + (x2 >> unat (8 :: 32 word)) in x3 + (x3 >> unat (16 :: 32 word)) AND (63 :: 32 word))" for bv
definition hammingD :: "32 word \<Rightarrow> 32 word \<Rightarrow> 32 word"
  where "hammingD a b = count (a XOR b)" for a b
end
