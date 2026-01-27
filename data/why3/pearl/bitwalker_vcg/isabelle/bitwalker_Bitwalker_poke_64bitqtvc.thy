theory bitwalker_Bitwalker_poke_64bitqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.WellFounded_WellFounded" "Why3STD.Ref_Ref" "mach.bv_BVCheck8" "mach.bv_BVCheck32" "mach.bv_BVCheck64"
begin
definition nth8_stream :: "8 word list \<Rightarrow> int \<Rightarrow> bool"
  where "nth8_stream stream pos = (take_bit (nat ((7 :: int) - pos emod (8 :: int))) (stream ! nat (pos ediv (8 :: int))) \<noteq> (0))" for stream pos
definition maxvalue :: "32 word \<Rightarrow> 64 word"
  where "maxvalue len = (1 :: 64 word) << unat (u32_to_u64 len)" for len
theorem poke_64bit'vc:
  fixes left1 :: "int"
  fixes flag :: "bool"
  fixes "value" :: "64 word"
  assumes fact0: "(0 :: int) \<le> left1"
  assumes fact1: "left1 < (64 :: int)"
  shows "let left_bv :: 64 word = w64_of_int left1 in (let mask :: 64 word = (1 :: 64 word) << unat (w64_of_int ((63 :: int) - left1)) in (case flag of True \<Rightarrow> True | False \<Rightarrow> True) \<and> (\<forall>(result :: 64 word). (case flag of True \<Rightarrow> result = value OR mask | False \<Rightarrow> result = value AND not mask) \<longrightarrow> (\<forall>(i :: 64 word). i \<le> (63 :: 64 word) \<longrightarrow> \<not>i = (63 :: 64 word) - left_bv \<longrightarrow> (take_bit (unat i) result \<noteq> (0)) = (take_bit (unat i) value \<noteq> (0))) \<and> flag = (take_bit (unat ((63 :: 64 word) - left_bv)) result \<noteq> (0)))) \<and> (\<forall>(result :: 64 word). (\<forall>(i :: 64 word). i \<le> (63 :: 64 word) \<longrightarrow> \<not>i = (63 :: 64 word) - left_bv \<longrightarrow> (take_bit (unat i) result \<noteq> (0)) = (take_bit (unat i) value \<noteq> (0))) \<and> flag = (take_bit (unat ((63 :: 64 word) - left_bv)) result \<noteq> (0)) \<longrightarrow> (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i < (64 :: int)) \<and> \<not>i = (63 :: int) - left1 \<longrightarrow> (take_bit (nat i) result \<noteq> (0)) = (take_bit (nat i) value \<noteq> (0))) \<and> flag = (take_bit (nat ((63 :: int) - left1)) result \<noteq> (0)))"
  sorry
end
