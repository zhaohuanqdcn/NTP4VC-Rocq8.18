theory ring_buffer_Top_createqtvc
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
theorem create'vc:
  fixes x :: "'a"
  shows "let o1 :: 'a list = ([] :: 'a list) in (0 :: int) \<le> (10 :: int) \<and> (\<forall>(o2 :: 'a list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (10 :: int) \<longrightarrow> o2 ! nat i = x) \<and> int (length o2) = (10 :: int) \<longrightarrow> ((0 :: int) < int (length o2) \<and> ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> int (length o2)) \<and> int (length o1) = (0 :: int) - (0 :: int) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) - (0 :: int) \<longrightarrow> o1 ! nat i = o2 ! nat ((0 :: int) + i))) \<and> (\<forall>(result :: 'a t). data result = o2 \<and> m result = (0 :: int) \<and> n result = (0 :: int) \<and> contents result = o1 \<longrightarrow> contents result = ([] :: 'a list)))"
  sorry
end
