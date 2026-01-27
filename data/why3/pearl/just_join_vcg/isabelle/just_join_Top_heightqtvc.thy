theory just_join_Top_heightqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
consts lt :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Trans:   "lt x z"
 if "lt x y"
 and "lt y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Asymm:   "\<not>lt y x"
 if "lt x y"
  for x :: "elt"
  and y :: "elt"
axiomatization where Trichotomy:   "lt x y \<or> lt y x \<or> x = y"
  for x :: "elt"
  and y :: "elt"
datatype  tree = E | N "int" "tree" "elt" "tree"
definition ht :: "tree \<Rightarrow> int"
  where "ht t = (case t of E \<Rightarrow> (0 :: int) | N h _ _ _ \<Rightarrow> h)" for t
definition node :: "tree \<Rightarrow> elt \<Rightarrow> tree \<Rightarrow> tree"
  where "node l x r = N ((1 :: int) + max (ht l) (ht r)) l x r" for l x r
theorem height'vc:
  fixes t :: "tree"
  shows "case t of E \<Rightarrow> True | N _ l _ r \<Rightarrow> True"
  and "\<forall>(result :: int). (case t of E \<Rightarrow> result = (0 :: int) | N _ l _ r \<Rightarrow> (\<exists>(o1 :: int). (0 :: int) \<le> o1 \<and> (\<exists>(o2 :: int). (0 :: int) \<le> o2 \<and> result = (1 :: int) + max o2 o1))) \<longrightarrow> (0 :: int) \<le> result"
  sorry
end
