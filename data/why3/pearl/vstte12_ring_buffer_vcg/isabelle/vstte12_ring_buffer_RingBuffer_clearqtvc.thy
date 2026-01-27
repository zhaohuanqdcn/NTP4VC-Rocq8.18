theory vstte12_ring_buffer_RingBuffer_clearqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a buffer
consts first :: "'a buffer \<Rightarrow> int"
consts len :: "'a buffer \<Rightarrow> int"
consts data :: "'a buffer \<Rightarrow> 'a list"
consts sequence :: "'a buffer \<Rightarrow> 'a list"
axiomatization where buffer'invariant:   "((0 :: int) \<le> first self \<and> first self < int (length (data self))) \<and> ((0 :: int) \<le> len self \<and> len self \<le> int (length (data self))) \<and> len self = int (length (sequence self)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len self \<longrightarrow> (first self + i < int (length (data self)) \<longrightarrow> nth_opt (sequence self) i = Some (data self ! nat (first self + i))) \<and> ((0 :: int) \<le> first self + i - int (length (data self)) \<longrightarrow> nth_opt (sequence self) i = Some (data self ! nat (first self + i - int (length (data self))))))"
  for self :: "'a buffer"
definition buffer'eq :: "'a buffer \<Rightarrow> 'a buffer \<Rightarrow> _"
  where "buffer'eq a b \<longleftrightarrow> first a = first b \<and> len a = len b \<and> data a = data b \<and> sequence a = sequence b" for a b
axiomatization where buffer'inj:   "a = b"
 if "buffer'eq a b"
  for a :: "'a buffer"
  and b :: "'a buffer"
definition size :: "'a buffer \<Rightarrow> int"
  where "size b = int (length (data b))" for b
theorem clear'vc:
  fixes b :: "'a buffer"
  fixes b1 :: "'a buffer"
  shows "let size1 :: int = int (length (data b)) in ((0 :: int) \<le> first b \<and> first b < size1) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> size1) \<and> (0 :: int) = int (length (Nil :: 'a list)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> (first b + i < size1 \<longrightarrow> nth_opt (Nil :: 'a list) i = Some (data b ! nat (first b + i))) \<and> ((0 :: int) \<le> first b + i - size1 \<longrightarrow> nth_opt (Nil :: 'a list) i = Some (data b ! nat (first b + i - size1))))"
  and "(Nil :: 'a list) = sequence b1 \<and> data b = data b1 \<and> (0 :: int) = len b1 \<and> first b = first b1 \<longrightarrow> len b1 = (0 :: int) \<and> sequence b1 = (Nil :: 'a list)"
  sorry
end
