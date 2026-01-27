theory vstte10_aqueue_AmortizedQueue_emptyqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a queue
consts front :: "'a queue \<Rightarrow> 'a list"
consts lenf :: "'a queue \<Rightarrow> int"
consts rear :: "'a queue \<Rightarrow> 'a list"
consts lenr :: "'a queue \<Rightarrow> int"
axiomatization where queue'invariant'0:   "int (length (front self)) = lenf self"
  for self :: "'a queue"
axiomatization where queue'invariant'1:   "int (length (rear self)) \<le> lenf self"
  for self :: "'a queue"
axiomatization where queue'invariant'2:   "int (length (rear self)) = lenr self"
  for self :: "'a queue"
definition queue'eq :: "'a queue \<Rightarrow> 'a queue \<Rightarrow> _"
  where "queue'eq a b \<longleftrightarrow> front a = front b \<and> lenf a = lenf b \<and> rear a = rear b \<and> lenr a = lenr b" for a b
axiomatization where queue'inj:   "a = b"
 if "queue'eq a b"
  for a :: "'a queue"
  and b :: "'a queue"
definition sequence :: "'a queue \<Rightarrow> 'a list"
  where "sequence q = front q @ rev (rear q)" for q
theorem empty'vc:
  shows "let o1 :: 'a list = (Nil :: 'a list); o2 :: 'a list = (Nil :: 'a list) in (int (length o2) = (0 :: int) \<and> int (length o1) \<le> (0 :: int) \<and> int (length o1) = (0 :: int)) \<and> (\<forall>(result :: 'a queue). front result = o2 \<and> lenf result = (0 :: int) \<and> rear result = o1 \<and> lenr result = (0 :: int) \<longrightarrow> sequence result = (Nil :: 'a list))"
  sorry
end
