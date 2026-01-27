theory vstte12_ring_buffer_HarnessSeq_harnessqtvc
  imports "NTP4Verif.NTP4Verif" "./vstte12_ring_buffer_RingBufferSeq"
begin
theorem harness'vc:
  shows "(0 :: int) < (10 :: int)"
  and "\<forall>(b :: int buffer). vstte12_ring_buffer_RingBufferSeq.size b = (10 :: int) \<and> sequence b = [] \<longrightarrow> len b < vstte12_ring_buffer_RingBufferSeq.size b \<and> (\<forall>(b1 :: int buffer). length (data b1) = length (data b) \<longrightarrow> first b = first b1 \<longrightarrow> len b1 = len b + (1 :: int) \<and> sequence b1 = sequence b @ [1 :: int] \<longrightarrow> len b1 < vstte12_ring_buffer_RingBufferSeq.size b1 \<and> (\<forall>(b2 :: int buffer). length (data b2) = length (data b1) \<longrightarrow> first b1 = first b2 \<longrightarrow> len b2 = len b1 + (1 :: int) \<and> sequence b2 = sequence b1 @ [2 :: int] \<longrightarrow> len b2 < vstte12_ring_buffer_RingBufferSeq.size b2 \<and> (\<forall>(b3 :: int buffer). length (data b3) = length (data b2) \<longrightarrow> first b2 = first b3 \<longrightarrow> len b3 = len b2 + (1 :: int) \<and> sequence b3 = sequence b2 @ [3 :: int] \<longrightarrow> (0 :: int) < len b3 \<and> (\<forall>(b4 :: int buffer). data b3 = data b4 \<longrightarrow> len b4 = len b3 - (1 :: int) \<and> sequence b4 = drop (1 :: nat) (sequence b3) \<longrightarrow> (0 :: int) < len b4 \<and> (\<forall>(b5 :: int buffer). data b4 = data b5 \<longrightarrow> len b5 = len b4 - (1 :: int) \<and> sequence b5 = drop (1 :: nat) (sequence b4) \<longrightarrow> (0 :: int) < len b5)))))"
  sorry
end
