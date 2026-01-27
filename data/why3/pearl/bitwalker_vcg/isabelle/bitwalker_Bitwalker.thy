theory bitwalker_Bitwalker
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "mach.bv_BVCheck8" "mach.bv_BVCheck32" "mach.bv_BVCheck64"
begin
definition nth8_stream :: "8 word list \<Rightarrow> int \<Rightarrow> bool"
  where "nth8_stream stream pos = (take_bit (nat ((7 :: int) - pos emod (8 :: int))) (stream ! nat (pos ediv (8 :: int))) \<noteq> (0))" for stream pos
definition maxvalue :: "32 word \<Rightarrow> 64 word"
  where "maxvalue len = (1 :: 64 word) << unat (u32_to_u64 len)" for len
end
