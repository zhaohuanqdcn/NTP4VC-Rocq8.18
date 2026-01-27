theory bitwalker_Bitwalker_nth64qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "mach.bv_BVCheck8" "mach.bv_BVCheck32" "mach.bv_BVCheck64"
begin
definition nth8_stream :: "8 word list \<Rightarrow> int \<Rightarrow> bool"
  where "nth8_stream stream pos = (take_bit (nat ((7 :: int) - pos emod (8 :: int))) (stream ! nat (pos ediv (8 :: int))) \<noteq> (0))" for stream pos
theorem nth64'vc:
  fixes i :: "int"
  fixes "value" :: "64 word"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < (64 :: int)"
  shows "(take_bit (nat i) value \<noteq> (0)) = (take_bit (unat (u32_to_u64 (w32_of_int i))) value \<noteq> (0))"
  sorry
end
