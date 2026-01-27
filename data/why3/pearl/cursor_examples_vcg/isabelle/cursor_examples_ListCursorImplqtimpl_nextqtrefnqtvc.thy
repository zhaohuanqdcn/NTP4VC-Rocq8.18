theory cursor_examples_ListCursorImplqtimpl_nextqtrefnqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a cursor
consts visited :: "'a cursor \<Rightarrow> 'a list"
consts collection :: "'a cursor \<Rightarrow> 'a list"
consts to_visit :: "'a cursor \<Rightarrow> 'a list"
axiomatization where cursor'invariant:   "visited self @ to_visit self = collection self"
  for self :: "'a cursor"
definition cursor'eq :: "'a cursor \<Rightarrow> 'a cursor \<Rightarrow> _"
  where "cursor'eq a b \<longleftrightarrow> visited a = visited b \<and> collection a = collection b \<and> to_visit a = to_visit b" for a b
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
  and "\<forall>(c1 :: 'a cursor). collection c = collection c1 \<longrightarrow> (\<forall>(result :: 'a). visited c1 = visited c @ [result] \<and> (case to_visit c of (Nil :: 'a list) \<Rightarrow> False | Cons x r \<Rightarrow> to_visit c1 = r \<and> x = result) \<longrightarrow> visited c1 = visited c @ [result] \<and> permitted c1)"
  sorry
end
