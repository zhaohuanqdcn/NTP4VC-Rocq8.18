theory cursor_examples_ListCursorImplqtimpl_createqtrefnqtvc
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
theorem create'refn'vc:
  fixes result :: "'a cursor"
  fixes l :: "'a list"
  assumes fact0: "visited result = ([] :: 'a list)"
  assumes fact1: "collection result = l"
  assumes fact2: "to_visit result = l"
  shows "permitted result"
  and "visited result = ([] :: 'a list)"
  and "collection result = l"
  sorry
end
