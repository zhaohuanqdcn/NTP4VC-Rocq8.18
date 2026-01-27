theory vstte12_tree_reconstruction_ZipperBased_g_appendqtvc
  imports "NTP4Verif.NTP4Verif" "./vstte12_tree_reconstruction_Tree"
begin
fun forest_depths :: "(int \<times> tree) list \<Rightarrow> int list"
  where "forest_depths (Nil :: (int \<times> tree) list) = (Nil :: int list)"
      | "forest_depths (Cons (d, t) r) = depths d t @ forest_depths r" for d t r
fun greedy :: "int \<Rightarrow> int \<Rightarrow> tree \<Rightarrow> _"
  where "greedy d d1 t1 = (\<not>d = d1 \<and> (case t1 of Leaf \<Rightarrow> True | Node l1 _ \<Rightarrow> greedy d (d1 + (1 :: int)) l1))" for d d1 t1
inductive g :: "(int \<times> tree) list \<Rightarrow> bool" where
   Gnil: "g (Nil :: (int \<times> tree) list)"
 | Gone: "g (Cons (d, t) (Nil :: (int \<times> tree) list))" for d :: "int" and t :: "tree"
 | Gtwo: "greedy d1 d2 t2 \<Longrightarrow> g (Cons (d1, t1) l) \<Longrightarrow> g (Cons (d2, t2) (Cons (d1, t1) l))" for d1 :: "int" and d2 :: "int" and t2 :: "tree" and t1 :: "tree" and l :: "(int \<times> tree) list"
theorem g_append'vc:
  fixes l1 :: "(int \<times> tree) list"
  fixes l2 :: "(int \<times> tree) list"
  assumes fact0: "g (l1 @ l2)"
  shows "g l1"
  sorry
end
