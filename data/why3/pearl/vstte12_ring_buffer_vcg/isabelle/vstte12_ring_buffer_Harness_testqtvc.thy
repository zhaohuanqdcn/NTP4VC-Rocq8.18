theory vstte12_ring_buffer_Harness_testqtvc
  imports "NTP4Verif.NTP4Verif" "./vstte12_ring_buffer_RingBuffer"
begin
theorem test'vc:
  fixes x :: "int"
  fixes y :: "int"
  fixes z :: "int"
  shows "(0 :: int) < (2 :: int)"
  and "\<forall>(b :: int buffer). vstte12_ring_buffer_RingBuffer.size b = (2 :: int) \<and> sequence b = (Nil :: int list) \<longrightarrow> len b < vstte12_ring_buffer_RingBuffer.size b \<and> (\<forall>(b1 :: int buffer). length (data b1) = length (data b) \<longrightarrow> first b = first b1 \<longrightarrow> len b1 = len b + (1 :: int) \<and> sequence b1 = sequence b @ Cons x (Nil :: int list) \<longrightarrow> len b1 < vstte12_ring_buffer_RingBuffer.size b1 \<and> (\<forall>(b2 :: int buffer). length (data b2) = length (data b1) \<longrightarrow> first b1 = first b2 \<longrightarrow> len b2 = len b1 + (1 :: int) \<and> sequence b2 = sequence b1 @ Cons y (Nil :: int list) \<longrightarrow> (0 :: int) < len b2 \<and> (\<forall>(b3 :: int buffer). data b2 = data b3 \<longrightarrow> (\<forall>(h :: int). len b3 = len b2 - (1 :: int) \<and> (case sequence b2 of Nil \<Rightarrow> False | Cons x1 l \<Rightarrow> h = x1 \<and> sequence b3 = l) \<longrightarrow> len b3 < vstte12_ring_buffer_RingBuffer.size b3 \<and> (\<forall>(b4 :: int buffer). length (data b4) = length (data b3) \<longrightarrow> first b3 = first b4 \<longrightarrow> len b4 = len b3 + (1 :: int) \<and> sequence b4 = sequence b3 @ Cons z (Nil :: int list) \<longrightarrow> (0 :: int) < len b4 \<and> (\<forall>(b5 :: int buffer). data b4 = data b5 \<longrightarrow> (\<forall>(h1 :: int). len b5 = len b4 - (1 :: int) \<and> (case sequence b4 of Nil \<Rightarrow> False | Cons x1 l \<Rightarrow> h1 = x1 \<and> sequence b5 = l) \<longrightarrow> (0 :: int) < len b5)))))))"
  sorry
end
