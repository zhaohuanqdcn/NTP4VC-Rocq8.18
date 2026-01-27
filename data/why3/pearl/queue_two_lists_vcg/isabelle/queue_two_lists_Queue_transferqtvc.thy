theory queue_two_lists_Queue_transferqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a t
consts front :: "'a t \<Rightarrow> 'a list"
consts rear :: "'a t \<Rightarrow> 'a list"
consts seq :: "'a t \<Rightarrow> 'a list"
axiomatization where t'invariant'0:   "int (length (seq self)) = int (length (front self)) + int (length (rear self))"
  for self :: "'a t"
axiomatization where t'invariant'1:   "(0 :: int) < int (length (front self)) \<longrightarrow> (0 :: int) < int (length (rear self))"
  for self :: "'a t"
axiomatization where t'invariant'2:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq self)) \<longrightarrow> seq self ! nat i = (let n :: int = int (length (rear self)) in if i < n then rear self ! nat i else front self ! nat (int (length (front self)) - (1 :: int) - (i - n)))"
  for self :: "'a t"
definition t'eq :: "'a t \<Rightarrow> 'a t \<Rightarrow> _"
  where "t'eq a b \<longleftrightarrow> front a = front b \<and> rear a = rear b \<and> seq a = seq b" for a b
axiomatization where t'inj:   "a = b"
 if "t'eq a b"
  for a :: "'a t"
  and b :: "'a t"
theorem transfer'vc:
  fixes q2 :: "'a t"
  fixes q11 :: "'a t"
  shows "case rear q2 of (Nil :: 'a list) \<Rightarrow> (\<forall>(q21 :: 'a t) (q1 :: 'a t). seq q1 = ([] :: 'a list) \<longrightarrow> (int (length (seq q11)) = int (length (front q11)) + int (length (rear q11)) \<and> ((0 :: int) < int (length (front q11)) \<longrightarrow> (0 :: int) < int (length (rear q11))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq q11)) \<longrightarrow> seq q11 ! nat i = (let n :: int = int (length (rear q11)) in if i < n then rear q11 ! nat i else front q11 ! nat (int (length (front q11)) - (1 :: int) - (i - n))))) \<and> (seq q11 = seq q21 \<and> rear q11 = rear q21 \<and> front q11 = front q21 \<longrightarrow> seq q1 = ([] :: 'a list) \<and> seq q21 = seq q2 @ seq q11)) | _ \<Rightarrow> (let o1 :: 'a list = seq q11; o2 :: 'a list = seq q2 @ o1 in int (length o2) = int (length (seq q2)) + int (length o1) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq q2)) \<longrightarrow> o2 ! nat i = seq q2 ! nat i) \<and> (\<forall>(i :: int). int (length (seq q2)) \<le> i \<and> i < int (length o2) \<longrightarrow> o2 ! nat i = o1 ! nat (i - int (length (seq q2)))) \<longrightarrow> (\<forall>(q21 :: 'a t) (q1 :: 'a t). seq q1 = ([] :: 'a list) \<longrightarrow> (int (length o2) = int (length (front q11 @ rev (rear q11) @ front q2)) + int (length (rear q2)) \<and> ((0 :: int) < int (length (front q11 @ rev (rear q11) @ front q2)) \<longrightarrow> (0 :: int) < int (length (rear q2))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o2) \<longrightarrow> o2 ! nat i = (let n :: int = int (length (rear q2)) in if i < n then rear q2 ! nat i else (front q11 @ rev (rear q11) @ front q2) ! nat (int (length (front q11 @ rev (rear q11) @ front q2)) - (1 :: int) - (i - n))))) \<and> (o2 = seq q21 \<and> rear q2 = rear q21 \<and> front q11 @ rev (rear q11) @ front q2 = front q21 \<longrightarrow> seq q1 = ([] :: 'a list) \<and> seq q21 = seq q2 @ seq q11)))"
  sorry
end
