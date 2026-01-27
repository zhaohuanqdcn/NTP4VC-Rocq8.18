theory cursor_examples_ArrayCursorImplqtimpl_nextqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a cursor
consts visited :: "'a cursor \<Rightarrow> 'a list"
consts collection :: "'a cursor \<Rightarrow> 'a list"
consts index :: "'a cursor \<Rightarrow> int"
axiomatization where cursor'invariant'0:   "(0 :: int) \<le> index self"
  for self :: "'a cursor"
axiomatization where cursor'invariant'1:   "index self \<le> int (length (collection self))"
  for self :: "'a cursor"
axiomatization where cursor'invariant'2:   "index self = int (length (visited self))"
  for self :: "'a cursor"
axiomatization where cursor'invariant'3:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < index self \<longrightarrow> collection self ! nat i = visited self ! nat i"
  for self :: "'a cursor"
definition cursor'eq :: "'a cursor \<Rightarrow> 'a cursor \<Rightarrow> _"
  where "cursor'eq a b \<longleftrightarrow> visited a = visited b \<and> collection a = collection b \<and> index a = index b" for a b
axiomatization where cursor'inj:   "a = b"
 if "cursor'eq a b"
  for a :: "'a cursor"
  and b :: "'a cursor"
definition permitted :: "'a cursor \<Rightarrow> _"
  where "permitted c \<longleftrightarrow> length (visited c) \<le> length (collection c) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length (visited c)) \<longrightarrow> visited c ! nat i = collection c ! nat i)" for c
definition complete :: "'a cursor \<Rightarrow> _"
  where "complete c \<longleftrightarrow> length (visited c) = length (collection c)" for c
theorem next'vc:
  fixes c :: "'a cursor"
  assumes fact0: "\<not>complete c"
  shows "\<not>int (length (collection c)) \<le> index c"
  and "let x :: 'a = collection c ! nat (index c); o1 :: 'a list = visited c; o2 :: 'a list = o1 @ [x] in int (length o2) = (1 :: int) + int (length o1) \<and> o2 ! length o1 = x \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o1) \<longrightarrow> o2 ! nat i = o1 ! nat i) \<longrightarrow> (\<forall>(c1 :: 'a cursor). (((0 :: int) \<le> index c + (1 :: int) \<and> index c + (1 :: int) \<le> int (length (collection c))) \<and> index c + (1 :: int) = int (length o2) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < index c + (1 :: int) \<longrightarrow> collection c ! nat i = o2 ! nat i)) \<and> (index c + (1 :: int) = index c1 \<and> collection c = collection c1 \<and> o2 = visited c1 \<longrightarrow> visited c1 = visited c @ [x] \<and> index c1 = index c + (1 :: int)))"
  sorry
end
