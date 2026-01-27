theory verifythis_2018_mind_the_gap_1_Top_leftqtvc
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
theorem left'vc:
  fixes g :: "gap_buffer"
  shows "if \<not>l g = (0 :: int) then ((0 :: int) \<le> l g - (1 :: int) \<and> l g - (1 :: int) < int (length (a g))) \<and> (let o1 :: char = a g ! nat (l g - (1 :: int)) in ((0 :: int) \<le> r g - (1 :: int) \<and> r g - (1 :: int) < int (length (a g))) \<and> (\<forall>(g1 :: gap_buffer). length ((a g)[nat (r g - (1 :: int)) := o1]) = length (a g) \<longrightarrow> length ((a g)[nat (r g - (1 :: int)) := o1]) = length (a g) \<longrightarrow> nth ((a g)[nat (r g - (1 :: int)) := o1]) o nat = (nth (a g) o nat)(r g - (1 :: int) := o1) \<longrightarrow> (((0 :: int) \<le> l g - (1 :: int) \<and> l g - (1 :: int) \<le> r g - (1 :: int) \<and> r g - (1 :: int) \<le> int (length ((a g)[nat (r g - (1 :: int)) := o1]))) \<and> int (length ((a g)[nat (r g - (1 :: int)) := o1])) = int (length (content g)) + (r g - (1 :: int)) - (l g - (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g - (1 :: int) \<longrightarrow> content g ! nat i = (nth ((a g)[nat (r g - (1 :: int)) := o1]) o nat) i) \<and> (\<forall>(i :: int). l g - (1 :: int) \<le> i \<and> i < int (length (content g)) \<longrightarrow> content g ! nat i = (nth ((a g)[nat (r g - (1 :: int)) := o1]) o nat) (i + (r g - (1 :: int)) - (l g - (1 :: int))))) \<and> (content g = content g1 \<and> r g - (1 :: int) = r g1 \<and> l g - (1 :: int) = l g1 \<and> (a g)[nat (r g - (1 :: int)) := o1] = a g1 \<longrightarrow> l g1 = (if l g = (0 :: int) then l g else l g - (1 :: int)) \<and> content g1 = content g))) else l g = (if l g = (0 :: int) then l g else l g - (1 :: int))"
  sorry
end
