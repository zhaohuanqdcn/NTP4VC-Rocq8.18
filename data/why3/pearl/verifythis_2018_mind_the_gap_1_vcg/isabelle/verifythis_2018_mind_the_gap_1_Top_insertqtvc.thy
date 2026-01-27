theory verifythis_2018_mind_the_gap_1_Top_insertqtvc
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
theorem insert'vc:
  fixes g :: "gap_buffer"
  fixes x :: "char"
  shows "if l g = r g then \<forall>(g1 :: gap_buffer). content g = content g1 \<and> l g = l g1 \<longrightarrow> (l g1 = l g \<and> content g1 = content g) \<and> l g1 < r g1 \<longrightarrow> (let o1 :: int = l g1; o2 :: char list = content g1 in ((0 :: int) \<le> o1 \<and> o1 \<le> int (length o2)) \<and> (let o3 :: char list = drop (nat o1) o2; o4 :: char list = Cons x o3 in int (length o4) = (1 :: int) + int (length o3) \<and> o4 ! (0 :: nat) = x \<and> (\<forall>(i :: int). (0 :: int) < i \<and> i \<le> int (length o3) \<longrightarrow> o4 ! nat i = o3 ! nat (i - (1 :: int))) \<longrightarrow> (let o5 :: int = l g1; o6 :: char list = content g1 in ((0 :: int) \<le> o5 \<and> o5 \<le> int (length o6)) \<and> (let o7 :: char list = take (nat o5) o6; o8 :: char list = o7 @ o4 in int (length o8) = int (length o7) + int (length o4) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o7) \<longrightarrow> o8 ! nat i = o7 ! nat i) \<and> (\<forall>(i :: int). int (length o7) \<le> i \<and> i < int (length o8) \<longrightarrow> o8 ! nat i = o4 ! nat (i - int (length o7))) \<longrightarrow> ((0 :: int) \<le> l g1 \<and> l g1 < int (length (a g1))) \<and> (length ((a g1)[nat (l g1) := x]) = length (a g1) \<longrightarrow> length ((a g1)[nat (l g1) := x]) = length (a g1) \<longrightarrow> nth ((a g1)[nat (l g1) := x]) o nat = (nth (a g1) o nat)(l g1 := x) \<longrightarrow> (\<forall>(g2 :: gap_buffer). (((0 :: int) \<le> l g1 + (1 :: int) \<and> l g1 + (1 :: int) \<le> r g1 \<and> r g1 \<le> int (length ((a g1)[nat (l g1) := x]))) \<and> int (length ((a g1)[nat (l g1) := x])) = int (length o8) + r g1 - (l g1 + (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g1 + (1 :: int) \<longrightarrow> o8 ! nat i = (nth ((a g1)[nat (l g1) := x]) o nat) i) \<and> (\<forall>(i :: int). l g1 + (1 :: int) \<le> i \<and> i < int (length o8) \<longrightarrow> o8 ! nat i = (nth ((a g1)[nat (l g1) := x]) o nat) (i + r g1 - (l g1 + (1 :: int))))) \<and> (o8 = content g2 \<and> r g1 = r g2 \<and> l g1 + (1 :: int) = l g2 \<and> (a g1)[nat (l g1) := x] = a g2 \<longrightarrow> l g2 = l g + (1 :: int) \<and> content g2 = take (nat (l g)) (content g) @ Cons x (drop (nat (l g)) (content g))))))))) else let o1 :: int = l g; o2 :: char list = content g in ((0 :: int) \<le> o1 \<and> o1 \<le> int (length o2)) \<and> (let o3 :: char list = drop (nat o1) o2; o4 :: char list = Cons x o3 in int (length o4) = (1 :: int) + int (length o3) \<and> o4 ! (0 :: nat) = x \<and> (\<forall>(i :: int). (0 :: int) < i \<and> i \<le> int (length o3) \<longrightarrow> o4 ! nat i = o3 ! nat (i - (1 :: int))) \<longrightarrow> (let o5 :: int = l g; o6 :: char list = content g in ((0 :: int) \<le> o5 \<and> o5 \<le> int (length o6)) \<and> (let o7 :: char list = take (nat o5) o6; o8 :: char list = o7 @ o4 in int (length o8) = int (length o7) + int (length o4) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length o7) \<longrightarrow> o8 ! nat i = o7 ! nat i) \<and> (\<forall>(i :: int). int (length o7) \<le> i \<and> i < int (length o8) \<longrightarrow> o8 ! nat i = o4 ! nat (i - int (length o7))) \<longrightarrow> ((0 :: int) \<le> l g \<and> l g < int (length (a g))) \<and> (length ((a g)[nat (l g) := x]) = length (a g) \<longrightarrow> length ((a g)[nat (l g) := x]) = length (a g) \<longrightarrow> nth ((a g)[nat (l g) := x]) o nat = (nth (a g) o nat)(l g := x) \<longrightarrow> (\<forall>(g1 :: gap_buffer). (((0 :: int) \<le> l g + (1 :: int) \<and> l g + (1 :: int) \<le> r g \<and> r g \<le> int (length ((a g)[nat (l g) := x]))) \<and> int (length ((a g)[nat (l g) := x])) = int (length o8) + r g - (l g + (1 :: int)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < l g + (1 :: int) \<longrightarrow> o8 ! nat i = (nth ((a g)[nat (l g) := x]) o nat) i) \<and> (\<forall>(i :: int). l g + (1 :: int) \<le> i \<and> i < int (length o8) \<longrightarrow> o8 ! nat i = (nth ((a g)[nat (l g) := x]) o nat) (i + r g - (l g + (1 :: int))))) \<and> (o8 = content g1 \<and> r g = r g1 \<and> l g + (1 :: int) = l g1 \<and> (a g)[nat (l g) := x] = a g1 \<longrightarrow> l g1 = l g + (1 :: int) \<and> content g1 = take (nat (l g)) (content g) @ Cons x (drop (nat (l g)) (content g))))))))"
  sorry
end
