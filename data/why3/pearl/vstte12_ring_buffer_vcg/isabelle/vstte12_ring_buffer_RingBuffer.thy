theory vstte12_ring_buffer_RingBuffer
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
end
