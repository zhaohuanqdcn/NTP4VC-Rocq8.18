theory queue_two_lists_Queue_pushqtvc
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
theorem push'vc:
  fixes q :: "'a t"
  fixes x :: "'a"
  shows "case rear q of (Nil :: 'a list) \<Rightarrow> (case front q of (Nil :: 'a list) \<Rightarrow> (let o1 :: 'a list = seq q @ [x] in int (length o1) = (1 :: int) + int (length (seq q)) \<and> o1 ! length (seq q) = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq q)) \<longrightarrow> o1 ! nat i = seq q ! nat i) \<longrightarrow> (\<forall>(q1 :: 'a t). (int (length o1) = int (length (front q)) + int (length (Cons x (Nil :: 'a list))) \<and> ((0 :: int) < int (length (front q)) \<longrightarrow> (0 :: int) < int (length (Cons x (Nil :: 'a list)))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = (let n :: int = int (length (Cons x (Nil :: 'a list))) in if i < n then Cons x (Nil :: 'a list) ! nat i else front q ! nat (int (length (front q)) - (1 :: int) - (i - n))))) \<and> (o1 = seq q1 \<and> Cons x (Nil :: 'a list) = rear q1 \<and> front q = front q1 \<longrightarrow> seq q1 = seq q @ [x]))) | _ \<Rightarrow> (let o1 :: 'a list = seq q @ [x] in int (length o1) = (1 :: int) + int (length (seq q)) \<and> o1 ! length (seq q) = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq q)) \<longrightarrow> o1 ! nat i = seq q ! nat i) \<longrightarrow> (\<forall>(q1 :: 'a t). (int (length o1) = int (length (Cons x (front q))) + int (length (rear q)) \<and> ((0 :: int) < int (length (Cons x (front q))) \<longrightarrow> (0 :: int) < int (length (rear q))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = (let n :: int = int (length (rear q)) in if i < n then rear q ! nat i else Cons x (front q) ! nat (int (length (Cons x (front q))) - (1 :: int) - (i - n))))) \<and> (o1 = seq q1 \<and> rear q = rear q1 \<and> Cons x (front q) = front q1 \<longrightarrow> seq q1 = seq q @ [x])))) | _ \<Rightarrow> (let o1 :: 'a list = seq q @ [x] in int (length o1) = (1 :: int) + int (length (seq q)) \<and> o1 ! length (seq q) = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (seq q)) \<longrightarrow> o1 ! nat i = seq q ! nat i) \<longrightarrow> (\<forall>(q1 :: 'a t). (int (length o1) = int (length (Cons x (front q))) + int (length (rear q)) \<and> ((0 :: int) < int (length (Cons x (front q))) \<longrightarrow> (0 :: int) < int (length (rear q))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = (let n :: int = int (length (rear q)) in if i < n then rear q ! nat i else Cons x (front q) ! nat (int (length (Cons x (front q))) - (1 :: int) - (i - n))))) \<and> (o1 = seq q1 \<and> rear q = rear q1 \<and> Cons x (front q) = front q1 \<longrightarrow> seq q1 = seq q @ [x])))"
  sorry
end
