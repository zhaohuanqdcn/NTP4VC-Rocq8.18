theory verifythis_2018_mind_the_gap_1_Top_rightqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
consts any_char :: "char"
typedecl  gap_buffer
consts a :: "gap_buffer \<Rightarrow> char list"
consts l :: "gap_buffer \<Rightarrow> int"
consts r :: "gap_buffer \<Rightarrow> int"
consts content :: "gap_buffer \<Rightarrow> char list"
axiomatization where gap_buffer'invariant'0:   "(0 :: int) \<le> l self"
  for self :: "gap_buffer"
axiomatization where gap_buffer'invariant'1:   "l self \<le> r self"
  for self :: "gap_buffer"
axiomatization where gap_buffer'invariant'2:   "r self \<le> int (length (a self))"
  for self :: "gap_buffer"
axiomatization where gap_buffer'invariant'3:   "int (length (a self)) = int (length (content self)) + r self - l self"
  for self :: "gap_buffer"
axiomatization where gap_buffer'invariant'4:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l self \<longrightarrow> content self ! nat i = (nth (a self) o nat) i"
  for self :: "gap_buffer"
axiomatization where gap_buffer'invariant'5:   "\<forall>(i :: int). l self \<le> i \<and> i < int (length (content self)) \<longrightarrow> content self ! nat i = (nth (a self) o nat) (i + r self - l self)"
  for self :: "gap_buffer"
definition gap_buffer'eq :: "gap_buffer \<Rightarrow> gap_buffer \<Rightarrow> _"
  where "gap_buffer'eq a1 b \<longleftrightarrow> a a1 = a b \<and> l a1 = l b \<and> r a1 = r b \<and> content a1 = content b" for a1 b
axiomatization where gap_buffer'inj:   "a1 = b"
 if "gap_buffer'eq a1 b"
  for a1 :: "gap_buffer"
  and b :: "gap_buffer"
theorem right'vc:
  fixes g :: "gap_buffer"
  shows "if \<not>r g = int (length (a g)) then let o1 :: int = r g; o2 :: char list = a g in ((0 :: int) \<le> o1 \<and> o1 < int (length o2)) \<and> (let o3 :: char = o2 ! nat o1; o4 :: int = l g; o5 :: char list = a g in ((0 :: int) \<le> o4 \<and> o4 < int (length o5)) \<and> (length (o5[nat o4 := o3]) = length o5 \<longrightarrow> length (o5[nat o4 := o3]) = length (a g) \<longrightarrow> nth (o5[nat o4 := o3]) o nat = (nth o5 o nat)(o4 := o3) \<longrightarrow> (\<forall>(g1 :: gap_buffer). (((0 :: int) \<le> l g + (1 :: int) \<and> l g + (1 :: int) \<le> r g + (1 :: int) \<and> r g + (1 :: int) \<le> int (length (o5[nat o4 := o3]))) \<and> int (length (o5[nat o4 := o3])) = int (length (content g)) + (r g + (1 :: int)) - (l g + (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g + (1 :: int) \<longrightarrow> content g ! nat i = (nth (o5[nat o4 := o3]) o nat) i) \<and> (\<forall>(i :: int). l g + (1 :: int) \<le> i \<and> i < int (length (content g)) \<longrightarrow> content g ! nat i = (nth (o5[nat o4 := o3]) o nat) (i + (r g + (1 :: int)) - (l g + (1 :: int))))) \<and> (content g = content g1 \<and> r g + (1 :: int) = r g1 \<and> l g + (1 :: int) = l g1 \<and> o5[nat o4 := o3] = a g1 \<longrightarrow> l g1 = (if l g = int (length (content g)) then l g else l g + (1 :: int)) \<and> content g1 = content g)))) else l g = (if l g = int (length (content g)) then l g else l g + (1 :: int))"
  sorry
end
