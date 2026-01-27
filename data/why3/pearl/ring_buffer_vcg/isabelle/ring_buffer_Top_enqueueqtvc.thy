theory ring_buffer_Top_enqueueqtvc
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
theorem enqueue'vc:
  fixes q :: "'a t"
  fixes x :: "'a"
  assumes fact0: "n q < int (length (data q))"
  shows "let o1 :: int = n q; o2 :: 'a list = data q in ((0 :: int) \<le> o1 \<and> o1 < int (length o2)) \<and> (length (o2[nat o1 := x]) = length o2 \<longrightarrow> length (o2[nat o1 := x]) = length (data q) \<longrightarrow> nth (o2[nat o1 := x]) o nat = (nth o2 o nat)(o1 := x) \<longrightarrow> (let o3 :: 'a list = contents q @ [x] in int (length o3) = (1 :: int) + int (length (contents q)) \<and> o3 ! length (contents q) = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (contents q)) \<longrightarrow> o3 ! nat i = contents q ! nat i) \<longrightarrow> (\<forall>(q1 :: 'a t). ((0 :: int) < int (length (o2[nat o1 := x])) \<and> ((0 :: int) \<le> m q \<and> m q \<le> n q + (1 :: int) \<and> n q + (1 :: int) \<le> int (length (o2[nat o1 := x]))) \<and> int (length o3) = n q + (1 :: int) - m q \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < m q - (n q + (1 :: int)) \<longrightarrow> o3 ! nat i = o2[nat o1 := x] ! nat (m q + i))) \<and> (o3 = contents q1 \<and> n q + (1 :: int) = n q1 \<and> m q = m q1 \<and> o2[nat o1 := x] = data q1 \<longrightarrow> contents q1 = contents q @ [x]))))"
  sorry
end
