theory vstte12_ring_buffer_RingBufferSeq_headqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a buffer
consts first :: "'a buffer \<Rightarrow> int"
consts len :: "'a buffer \<Rightarrow> int"
consts data :: "'a buffer \<Rightarrow> 'a list"
consts sequence :: "'a buffer \<Rightarrow> 'a list"
axiomatization where buffer'invariant:   "((0 :: int) \<le> first self \<and> first self < int (length (data self))) \<and> ((0 :: int) \<le> len self \<and> len self \<le> int (length (data self))) \<and> len self = int (length (sequence self)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len self \<longrightarrow> (first self + i < int (length (data self)) \<longrightarrow> sequence self ! nat i = data self ! nat (first self + i)) \<and> ((0 :: int) \<le> first self + i - int (length (data self)) \<longrightarrow> sequence self ! nat i = data self ! nat (first self + i - int (length (data self)))))"
  for self :: "'a buffer"
definition buffer'eq :: "'a buffer \<Rightarrow> 'a buffer \<Rightarrow> _"
  where "buffer'eq a b \<longleftrightarrow> first a = first b \<and> len a = len b \<and> data a = data b \<and> sequence a = sequence b" for a b
axiomatization where buffer'inj:   "a = b"
 if "buffer'eq a b"
  for a :: "'a buffer"
  and b :: "'a buffer"
definition size :: "'a buffer \<Rightarrow> int"
  where "size b = int (length (data b))" for b
theorem head'vc:
  fixes b :: "'a buffer"
  assumes fact0: "(0 :: int) < len b"
  shows "let o1 :: int = first b; o2 :: 'a list = data b in ((0 :: int) \<le> o1 \<and> o1 < int (length o2)) \<and> o2 ! nat o1 = sequence b ! (0 :: nat)"
  sorry
end
