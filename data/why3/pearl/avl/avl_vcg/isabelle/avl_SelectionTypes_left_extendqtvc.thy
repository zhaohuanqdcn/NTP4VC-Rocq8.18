theory avl_SelectionTypes_left_extendqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a split = split'mk (left1: "'a list") (middle: "'a option") (right1: "'a list")
datatype 'a part_base = Left "'a" | Right "'a" | Here
definition option_to_seq :: "'a option \<Rightarrow> 'a list"
  where "option_to_seq o1 = (case o1 of Some x \<Rightarrow> [x] | (None :: 'a option) \<Rightarrow> ([] :: 'a list))" for o1
definition rebuild :: "'a split \<Rightarrow> 'a list"
  where "rebuild p = (left1 p @ option_to_seq (middle p)) @ right1 p" for p
theorem left_extend'vc:
  shows "True"
  sorry
end
