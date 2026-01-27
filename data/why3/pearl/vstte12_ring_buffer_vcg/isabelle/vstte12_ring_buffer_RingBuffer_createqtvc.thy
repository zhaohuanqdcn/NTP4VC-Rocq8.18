theory vstte12_ring_buffer_RingBuffer_createqtvc
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
theorem create'vc:
  fixes n :: "int"
  fixes dummy :: "'a"
  assumes fact0: "(0 :: int) < n"
  shows "let o1 :: 'a list = (Nil :: 'a list) in (0 :: int) \<le> n \<and> (\<forall>(o2 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> o2 ! nat i = dummy) \<and> int (length o2) = n \<longrightarrow> (let size1 :: int = int (length o2) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < size1) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> size1) \<and> (0 :: int) = int (length o1) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<longrightarrow> ((0 :: int) + i < size1 \<longrightarrow> nth_opt o1 i = Some (o2 ! nat ((0 :: int) + i))) \<and> ((0 :: int) \<le> (0 :: int) + i - size1 \<longrightarrow> nth_opt o1 i = Some (o2 ! nat ((0 :: int) + i - size1))))) \<and> (\<forall>(result :: 'a buffer). first result = (0 :: int) \<and> len result = (0 :: int) \<and> data result = o2 \<and> sequence result = o1 \<longrightarrow> size result = n \<and> sequence result = (Nil :: 'a list)))"
  sorry
end
