theory cursor_examples_ArrayCursorImplqtimpl_nextqtrefnqtvc
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
theorem next'refn'vc:
  fixes c :: "'a cursor"
  assumes fact0: "\<not>complete c"
  assumes fact1: "permitted c"
  shows "\<not>complete c"
  and "\<forall>(c1 :: 'a cursor). collection c = collection c1 \<longrightarrow> (\<forall>(result :: 'a). visited c1 = visited c @ [result] \<and> index c1 = index c + (1 :: int) \<longrightarrow> visited c1 = visited c @ [result] \<and> permitted c1)"
  sorry
end
