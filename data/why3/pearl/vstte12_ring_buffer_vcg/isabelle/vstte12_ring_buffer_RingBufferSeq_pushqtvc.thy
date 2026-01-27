theory vstte12_ring_buffer_RingBufferSeq_pushqtvc
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
theorem push'vc:
  fixes b :: "'a buffer"
  fixes x :: "'a"
  assumes fact0: "len b < size b"
  shows "let o1 :: 'a list = sequence b; o2 :: 'a list = o1 @ [x] in int (length o2) = (1 :: int) + int (length o1) \<and> o2 ! length o1 = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o2 ! nat i = o1 ! nat i) \<longrightarrow> (let i :: int = first b + len b; n :: int = int (length (data b)) in \<forall>(o3 :: int). (if n \<le> i then o3 = i - n else o3 = i) \<longrightarrow> ((0 :: int) \<le> o3 \<and> o3 < int (length (data b))) \<and> (length ((data b)[nat o3 := x]) = length (data b) \<longrightarrow> length ((data b)[nat o3 := x]) = length (data b) \<longrightarrow> nth ((data b)[nat o3 := x]) o nat = (nth (data b) o nat)(o3 := x) \<longrightarrow> (\<forall>(b1 :: 'a buffer). (let size1 :: int = int (length ((data b)[nat o3 := x])) in ((0 :: int) \<le> first b \<and> first b < size1) \<and> ((0 :: int) \<le> len b + (1 :: int) \<and> len b + (1 :: int) \<le> size1) \<and> len b + (1 :: int) = int (length o2) \<and> (\<forall>(i1 :: int). (0 :: int) \<le> i1 \<and> i1 < len b + (1 :: int) \<longrightarrow> (first b + i1 < size1 \<longrightarrow> o2 ! nat i1 = (data b)[nat o3 := x] ! nat (first b + i1)) \<and> ((0 :: int) \<le> first b + i1 - size1 \<longrightarrow> o2 ! nat i1 = (data b)[nat o3 := x] ! nat (first b + i1 - size1)))) \<and> (o2 = sequence b1 \<and> (data b)[nat o3 := x] = data b1 \<and> len b + (1 :: int) = len b1 \<and> first b = first b1 \<longrightarrow> len b1 = len b + (1 :: int) \<and> sequence b1 = sequence b @ [x]))))"
  sorry
end
