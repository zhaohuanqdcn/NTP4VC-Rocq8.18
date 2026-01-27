theory verifythis_2018_mind_the_gap_1_Top_growqtvc
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
theorem grow'vc:
  fixes k :: "int"
  fixes g :: "gap_buffer"
  assumes fact0: "(0 :: int) < k"
  shows "let o1 :: int = int (length (a g)) + k in (0 :: int) \<le> o1 \<and> (\<forall>(b :: char list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o1 \<longrightarrow> b ! nat i = any_char) \<and> int (length b) = o1 \<longrightarrow> (let o2 :: int = l g; o3 :: char list = a g in (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o2 \<and> (0 :: int) + o2 \<le> int (length o3)) \<and> (0 :: int) \<le> (0 :: int) \<and> (0 :: int) + o2 \<le> int (length b)) \<and> (\<forall>(b1 :: char list). length b1 = length b \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) \<or> (0 :: int) + o2 \<le> i \<and> i < int (length b1) \<longrightarrow> b1 ! nat i = b ! nat i) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (0 :: int) + o2 \<longrightarrow> b1 ! nat i = o3 ! nat ((0 :: int) + i - (0 :: int))) \<longrightarrow> (let o4 :: int = int (length (a g)) - r g; o5 :: int = r g + k; o6 :: int = r g; o7 :: char list = a g in (((0 :: int) \<le> o6 \<and> (0 :: int) \<le> o4 \<and> o6 + o4 \<le> int (length o7)) \<and> (0 :: int) \<le> o5 \<and> o5 + o4 \<le> int (length b1)) \<and> (\<forall>(b2 :: char list). length b2 = length b1 \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o5 \<or> o5 + o4 \<le> i \<and> i < int (length b2) \<longrightarrow> b2 ! nat i = b1 ! nat i) \<and> (\<forall>(i :: int). o5 \<le> i \<and> i < o5 + o4 \<longrightarrow> b2 ! nat i = o7 ! nat (o6 + i - o5)) \<longrightarrow> (\<forall>(g1 :: gap_buffer). (((0 :: int) \<le> l g \<and> l g \<le> r g + k \<and> r g + k \<le> int (length b2)) \<and> int (length b2) = int (length (content g)) + (r g + k) - l g \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g \<longrightarrow> content g ! nat i = (nth b2 o nat) i) \<and> (\<forall>(i :: int). l g \<le> i \<and> i < int (length (content g)) \<longrightarrow> content g ! nat i = (nth b2 o nat) (i + (r g + k) - l g))) \<and> (content g = content g1 \<and> r g + k = r g1 \<and> l g = l g1 \<and> b2 = a g1 \<longrightarrow> (l g1 = l g \<and> content g1 = content g) \<and> l g1 < r g1)))))))"
  sorry
end
