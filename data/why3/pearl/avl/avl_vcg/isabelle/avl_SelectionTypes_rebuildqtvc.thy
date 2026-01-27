theory avl_SelectionTypes_rebuildqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a split = split'mk (left1: "'a list") (middle: "'a option") (right1: "'a list")
datatype 'a part_base = Left "'a" | Right "'a" | Here
definition option_to_seq :: "'a option \<Rightarrow> 'a list"
  where "option_to_seq o1 = (case o1 of Some x \<Rightarrow> [x] | (None :: 'a option) \<Rightarrow> ([] :: 'a list))" for o1
theorem rebuild'vc:
  shows "True"
  sorry
end
