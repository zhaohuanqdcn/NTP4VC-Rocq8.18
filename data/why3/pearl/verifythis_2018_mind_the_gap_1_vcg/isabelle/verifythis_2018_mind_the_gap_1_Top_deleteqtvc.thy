theory verifythis_2018_mind_the_gap_1_Top_deleteqtvc
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
theorem delete'vc:
  fixes g :: "gap_buffer"
  shows "if \<not>l g = (0 :: int) then let o1 :: int = l g; o2 :: char list = content g in ((0 :: int) \<le> o1 \<and> o1 \<le> int (length o2)) \<and> (let o3 :: char list = drop (nat o1) o2; o4 :: int = l g - (1 :: int); o5 :: char list = content g in ((0 :: int) \<le> o4 \<and> o4 \<le> int (length o5)) \<and> (let o6 :: char list = take (nat o4) o5; o7 :: char list = o6 @ o3 in int (length o7) = int (length o6) + int (length o3) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o6) \<longrightarrow> o7 ! nat i = o6 ! nat i) \<and> (\<forall>(i :: int). int (length o6) \<le> i \<and> i < int (length o7) \<longrightarrow> o7 ! nat i = o3 ! nat (i - int (length o6))) \<longrightarrow> (\<forall>(g1 :: gap_buffer). (((0 :: int) \<le> l g - (1 :: int) \<and> l g - (1 :: int) \<le> r g \<and> r g \<le> int (length (a g))) \<and> int (length (a g)) = int (length o7) + r g - (l g - (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g - (1 :: int) \<longrightarrow> o7 ! nat i = (nth (a g) o nat) i) \<and> (\<forall>(i :: int). l g - (1 :: int) \<le> i \<and> i < int (length o7) \<longrightarrow> o7 ! nat i = (nth (a g) o nat) (i + r g - (l g - (1 :: int))))) \<and> (o7 = content g1 \<and> r g = r g1 \<and> l g - (1 :: int) = l g1 \<and> a g = a g1 \<longrightarrow> (if l g = (0 :: int) then g1 = g else l g1 = l g - (1 :: int) \<and> content g1 = take (nat (l g - (1 :: int))) (content g) @ drop (nat (l g)) (content g)))))) else \<not>l g = (0 :: int) \<longrightarrow> l g = l g - (1 :: int) \<and> content g = take (nat (l g - (1 :: int))) (content g) @ drop (nat (l g)) (content g)"
  sorry
end
