theory tree_height_Iteration_sizew_nonnegqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.bintree_Tree" "Why3STD.bintree_Size" "Why3STD.bintree_Height"
begin
datatype 'a cont = Id | Kleft "'a tree" "'a cont" | Kright "int" "'a cont"
datatype 'a what = Argument "'a tree" | Result "int"
definition is_id :: "'a cont \<Rightarrow> _"
  where "is_id k \<longleftrightarrow> (case k of (Id :: 'a cont) \<Rightarrow> True | _ \<Rightarrow> False)" for k
definition is_result :: "'a what \<Rightarrow> _"
  where "is_result w \<longleftrightarrow> (case w of Result _ \<Rightarrow> True | _ \<Rightarrow> False)" for w
fun evalk :: "'a cont \<Rightarrow> int \<Rightarrow> int"
  where "evalk (Id :: 'a cont) r = r" for r
      | "evalk (Kleft l k1) r = evalk k1 ((1 :: int) + max (height l) r)" for l k1 r
      | "evalk (Kright x k1) r = evalk k1 ((1 :: int) + max x r)" for x k1 r
definition evalw :: "'a what \<Rightarrow> int"
  where "evalw w = (case w of Argument t \<Rightarrow> height t | Result x \<Rightarrow> x)" for w
fun sizek :: "'a cont \<Rightarrow> int"
  where "sizek (Id :: 'a cont) = (0 :: int)"
      | "sizek (Kleft t k1) = (3 :: int) + (4 :: int) * bintree_Size.size t + sizek k1" for t k1
      | "sizek (Kright x k1) = (1 :: int) + sizek k1" for x k1
definition sizew :: "'a what \<Rightarrow> int"
  where "sizew w = (case w of Argument t \<Rightarrow> (1 :: int) + (4 :: int) * bintree_Size.size t | Result _ \<Rightarrow> (0 :: int))" for w
theorem sizew_nonneg'vc:
  fixes w :: "'a what"
  shows "(0 :: int) \<le> sizew w"
  sorry
end
