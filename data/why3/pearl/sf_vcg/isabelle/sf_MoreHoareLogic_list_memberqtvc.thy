theory sf_MoreHoareLogic_list_memberqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
fun sum :: "int list \<Rightarrow> int"
  where "sum (Nil :: int list) = (0 :: int)"
      | "sum (Cons x r) = x + sum r" for x r
typedecl  elt
consts eq :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "elt"
  and y :: "elt"
theorem list_member'vc:
  fixes x :: "elt list"
  fixes y :: "elt"
  shows "length x \<le> length x"
  and "(0 :: int) = (1 :: int) \<and> y \<in> set x \<or> True"
  and "\<forall>(z :: int) (x1 :: elt list). length x1 \<le> length x \<and> (y \<in> set x1 \<longrightarrow> y \<in> set x) \<and> (z = (1 :: int) \<and> y \<in> set x \<or> z = (0 :: int) \<and> (y \<in> set x \<longrightarrow> y \<in> set x1)) \<longrightarrow> (is_Nil x1 \<longleftrightarrow> x1 = (Nil :: elt list)) \<longrightarrow> (if \<not>is_Nil x1 then \<not>x1 = (Nil :: elt list) \<and> (\<forall>(o1 :: elt). Some o1 = (if x1 = Nil then None else Some (hd x1)) \<longrightarrow> (eq y o1 \<longleftrightarrow> y = o1) \<longrightarrow> (if eq y o1 then \<not>x1 = (Nil :: elt list) \<and> (\<forall>(o2 :: elt list). Some o2 = (if x1 = Nil then None else Some (tl x1)) \<longrightarrow> (case x1 of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = o2) \<and> length o2 \<le> length x \<and> (y \<in> set o2 \<longrightarrow> y \<in> set x) \<and> (y \<in> set x \<or> (1 :: int) = (0 :: int) \<and> (y \<in> set x \<longrightarrow> y \<in> set o2))) else \<not>x1 = (Nil :: elt list) \<and> (\<forall>(o2 :: elt list). Some o2 = (if x1 = Nil then None else Some (tl x1)) \<longrightarrow> (case x1 of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = o2) \<and> length o2 \<le> length x \<and> (y \<in> set o2 \<longrightarrow> y \<in> set x) \<and> (z = (1 :: int) \<and> y \<in> set x \<or> z = (0 :: int) \<and> (y \<in> set x \<longrightarrow> y \<in> set o2))))) else z = (1 :: int) \<longleftrightarrow> y \<in> set x)"
  sorry
end
