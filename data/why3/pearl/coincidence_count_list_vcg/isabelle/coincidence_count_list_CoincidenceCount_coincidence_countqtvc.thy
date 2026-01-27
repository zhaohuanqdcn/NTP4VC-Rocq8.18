theory coincidence_count_list_CoincidenceCount_coincidence_countqtvc
  imports "NTP4Verif.NTP4Verif"
begin
inductive sorted :: "int list \<Rightarrow> bool" where
   Sorted_Nil: "sorted (Nil :: int list)"
 | Sorted_One: "sorted (Cons x (Nil :: int list))" for x :: "int"
 | Sorted_Two: "x < y \<Longrightarrow> sorted (Cons y l) \<Longrightarrow> sorted (Cons x (Cons y l))" for x :: "int" and y :: "int" and l :: "int list"
axiomatization where sorted_mem:   "(\<forall>(y :: int). y \<in> set l \<longrightarrow> x < y) \<and> sorted l \<longleftrightarrow> sorted (Cons x l)"
  for l :: "int list"
  and x :: "int"
axiomatization where sorted_append:   "sorted l1 \<and> sorted l2 \<and> (\<forall>(x :: int) (y :: int). x \<in> set l1 \<longrightarrow> y \<in> set l2 \<longrightarrow> x < y) \<longleftrightarrow> sorted (l1 @ l2)"
  for l1 :: "int list"
  and l2 :: "int list"
theorem coincidence_count'vc:
  fixes a :: "int list"
  fixes b :: "int list"
  assumes fact0: "sorted a"
  assumes fact1: "sorted b"
  shows "case b of Cons x x1 \<Rightarrow> (case a of Cons x2 x3 \<Rightarrow> (if x2 = x then ((case a of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = x3) \<or> a = x3 \<and> (case b of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = x1)) \<and> sorted x3 \<and> sorted x1 else if x2 < x then (case a of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = x3) \<and> sorted x3 \<and> sorted b else (case b of Nil \<Rightarrow> False | Cons _ f \<Rightarrow> f = x1) \<and> sorted a \<and> sorted x1) | _ \<Rightarrow> True) | _ \<Rightarrow> True"
  and "\<forall>(result :: int FSet.fset). (case b of Cons x x1 \<Rightarrow> (case a of Cons x2 x3 \<Rightarrow> (if x2 = x then \<exists>(o1 :: int FSet.fset). o1 = fset_of_list x3 |\<inter>| fset_of_list x1 \<and> result = finsert x2 o1 \<and> (if x2 |\<in>| o1 then fcard result = fcard o1 else int (fcard result) = int (fcard o1) + (1 :: int)) else if x2 < x then result = fset_of_list x3 |\<inter>| fset_of_list b else result = fset_of_list a |\<inter>| fset_of_list x1) | _ \<Rightarrow> result = fempty \<and> int (fcard result) = (0 :: int)) | _ \<Rightarrow> result = fempty \<and> int (fcard result) = (0 :: int)) \<longrightarrow> result = fset_of_list a |\<inter>| fset_of_list b"
  sorry
end
