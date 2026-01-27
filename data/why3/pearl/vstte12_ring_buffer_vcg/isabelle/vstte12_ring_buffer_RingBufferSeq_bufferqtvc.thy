theory vstte12_ring_buffer_RingBufferSeq_bufferqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem buffer'vc:
  fixes o2 :: "'a"
  shows "(0 :: int) \<le> (1 :: int)"
  and "\<forall>(o1 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (1 :: int) \<longrightarrow> o1 ! nat i = o2) \<and> int (length o1) = (1 :: int) \<longrightarrow> (let sequence :: 'a list = ([] :: 'a list); size :: int = int (length o1) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < size) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> size) \<and> (0 :: int) = int (length sequence) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> ((0 :: int) + i < size \<longrightarrow> sequence ! nat i = o1 ! nat ((0 :: int) + i)) \<and> ((0 :: int) \<le> (0 :: int) + i - size \<longrightarrow> sequence ! nat i = o1 ! nat ((0 :: int) + i - size))))"
  sorry
end
