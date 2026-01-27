theory queue_two_lists_Queue_is_emptyqtvc
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
theorem is_empty'vc:
  fixes q :: "'a t"
  fixes result :: "bool"
  assumes fact0: "case rear q of (Nil :: 'a list) \<Rightarrow> (case front q of (Nil :: 'a list) \<Rightarrow> result = True | _ \<Rightarrow> result = False) | _ \<Rightarrow> result = False"
  shows "result = True \<longleftrightarrow> seq q = ([] :: 'a list)"
  sorry
end
