theory vstte12_ring_buffer_RingBuffer_popqtvc
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
theorem pop'vc:
  fixes b :: "'a buffer"
  assumes fact0: "(0 :: int) < len b"
  shows "case sequence b of (Nil :: 'a list) \<Rightarrow> False | Cons _ s \<Rightarrow> ((0 :: int) \<le> first b \<and> first b < int (length (data b))) \<and> (let r :: 'a = data b ! nat (first b) in \<forall>(b1 :: 'a buffer). if first b + (1 :: int) = int (length (data b)) then \<forall>(b2 :: 'a buffer). (let size1 :: int = int (length (data b)) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) < size1) \<and> ((0 :: int) \<le> len b - (1 :: int) \<and> len b - (1 :: int) \<le> size1) \<and> len b - (1 :: int) = int (length s) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len b - (1 :: int) \<longrightarrow> ((0 :: int) + i < size1 \<longrightarrow> nth_opt s i = Some (data b ! nat ((0 :: int) + i))) \<and> ((0 :: int) \<le> (0 :: int) + i - size1 \<longrightarrow> nth_opt s i = Some (data b ! nat ((0 :: int) + i - size1))))) \<and> (s = sequence b2 \<and> data b = data b2 \<and> len b - (1 :: int) = len b2 \<and> (0 :: int) = first b2 \<longrightarrow> len b2 = len b - (1 :: int) \<and> (case sequence b of (Nil :: 'a list) \<Rightarrow> False | Cons x l \<Rightarrow> r = x \<and> sequence b2 = l)) else (let size1 :: int = int (length (data b)) in ((0 :: int) \<le> first b + (1 :: int) \<and> first b + (1 :: int) < size1) \<and> ((0 :: int) \<le> len b - (1 :: int) \<and> len b - (1 :: int) \<le> size1) \<and> len b - (1 :: int) = int (length s) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len b - (1 :: int) \<longrightarrow> (first b + (1 :: int) + i < size1 \<longrightarrow> nth_opt s i = Some (data b ! nat (first b + (1 :: int) + i))) \<and> ((0 :: int) \<le> first b + (1 :: int) + i - size1 \<longrightarrow> nth_opt s i = Some (data b ! nat (first b + (1 :: int) + i - size1))))) \<and> (s = sequence b1 \<and> data b = data b1 \<and> len b - (1 :: int) = len b1 \<and> first b + (1 :: int) = first b1 \<longrightarrow> len b1 = len b - (1 :: int) \<and> (case sequence b of (Nil :: 'a list) \<Rightarrow> False | Cons x l \<Rightarrow> r = x \<and> sequence b1 = l)))"
  sorry
end
