theory queue_two_lists_Queue_popqtvc
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
theorem pop'vc:
  fixes q :: "'a t"
  shows "case rear q of (Nil :: 'a list) \<Rightarrow> seq q = ([] :: 'a list) | Cons x (Nil :: 'a list) \<Rightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> int (length (seq q))) \<and> (\<forall>(q1 :: 'a t). (int (length (drop (1 :: nat) (seq q))) = int (length (Nil :: 'a list)) + int (length (rev (front q))) \<and> ((0 :: int) < int (length (Nil :: 'a list)) \<longrightarrow> (0 :: int) < int (length (rev (front q)))) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (drop (1 :: nat) (seq q))) \<longrightarrow> drop (1 :: nat) (seq q) ! nat i = (let n :: int = int (length (rev (front q))) in if i < n then rev (front q) ! nat i else (Nil :: 'a list) ! nat (int (length (Nil :: 'a list)) - (1 :: int) - (i - n))))) \<and> (drop (1 :: nat) (seq q) = seq q1 \<and> rev (front q) = rear q1 \<and> (Nil :: 'a list) = front q1 \<longrightarrow> \<not>seq q = ([] :: 'a list) \<and> x = seq q ! (0 :: nat) \<and> seq q1 = drop (1 :: nat) (seq q))) | Cons x s \<Rightarrow> ((0 :: int) \<le> (1 :: int) \<and> (1 :: int) \<le> int (length (seq q))) \<and> (\<forall>(q1 :: 'a t). (int (length (drop (1 :: nat) (seq q))) = int (length (front q)) + int (length s) \<and> ((0 :: int) < int (length (front q)) \<longrightarrow> (0 :: int) < int (length s)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (drop (1 :: nat) (seq q))) \<longrightarrow> drop (1 :: nat) (seq q) ! nat i = (let n :: int = int (length s) in if i < n then s ! nat i else front q ! nat (int (length (front q)) - (1 :: int) - (i - n))))) \<and> (drop (1 :: nat) (seq q) = seq q1 \<and> s = rear q1 \<and> front q = front q1 \<longrightarrow> \<not>seq q = ([] :: 'a list) \<and> x = seq q ! (0 :: nat) \<and> seq q1 = drop (1 :: nat) (seq q)))"
  sorry
end
