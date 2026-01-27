theory ring_buffer_Top_dequeueqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a t
consts data :: "'a t \<Rightarrow> 'a list"
consts m :: "'a t \<Rightarrow> int"
consts n :: "'a t \<Rightarrow> int"
consts contents :: "'a t \<Rightarrow> 'a list"
axiomatization where t'invariant'0:   "(0 :: int) < int (length (data self))"
  for self :: "'a t"
axiomatization where t'invariant'1:   "(0 :: int) \<le> m self"
  for self :: "'a t"
axiomatization where t'invariant'2:   "m self \<le> n self"
  for self :: "'a t"
axiomatization where t'invariant'3:   "n self \<le> int (length (data self))"
  for self :: "'a t"
axiomatization where t'invariant'4:   "int (length (contents self)) = n self - m self"
  for self :: "'a t"
axiomatization where t'invariant'5:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < m self - n self \<longrightarrow> contents self ! nat i = data self ! nat (m self + i)"
  for self :: "'a t"
definition t'eq :: "'a t \<Rightarrow> 'a t \<Rightarrow> _"
  where "t'eq a b \<longleftrightarrow> data a = data b \<and> m a = m b \<and> n a = n b \<and> contents a = contents b" for a b
axiomatization where t'inj:   "a = b"
 if "t'eq a b"
  for a :: "'a t"
  and b :: "'a t"
theorem dequeue'vc:
  fixes q :: "'a t"
  assumes fact0: "(0 :: int) < int (length (contents q))"
  shows "let o1 :: int = m q in ((0 :: int) \<le> o1 \<and> o1 < int (length (data q))) \<and> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> int (length (contents q))) \<and> (\<forall>(q1 :: 'a t). ((0 :: int) < int (length (data q)) \<and> ((0 :: int) \<le> m q + (1 :: int) \<and> m q + (1 :: int) \<le> n q \<and> n q \<le> int (length (data q))) \<and> int (length (drop (1 :: nat) (contents q))) = n q - (m q + (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < m q + (1 :: int) - n q \<longrightarrow> drop (1 :: nat) (contents q) ! nat i = data q ! nat (m q + (1 :: int) + i))) \<and> (drop (1 :: nat) (contents q) = contents q1 \<and> n q = n q1 \<and> m q + (1 :: int) = m q1 \<and> data q = data q1 \<longrightarrow> contents q1 = drop (1 :: nat) (contents q)))"
  sorry
end
