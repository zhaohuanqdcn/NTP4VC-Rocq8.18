theory edit_distance_MyWord_key_lemma_leftqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
inductive dist :: "char list \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> bool" where
   dist_eps: "dist (Nil :: char list) (Nil :: char list) (0 :: int)"
 | dist_add_left: "dist w1 w2 n \<Longrightarrow> dist (Cons a w1) w2 (n + (1 :: int))" for w1 :: "char list" and w2 :: "char list" and n :: "int" and a :: "char"
 | dist_add_right: "dist w1 w2 n \<Longrightarrow> dist w1 (Cons a w2) (n + (1 :: int))" for w1 :: "char list" and w2 :: "char list" and n :: "int" and a :: "char"
 | dist_context: "dist w1 w2 n \<Longrightarrow> dist (Cons a w1) (Cons a w2) n" for w1 :: "char list" and w2 :: "char list" and n :: "int" and a :: "char"
definition min_dist :: "char list \<Rightarrow> char list \<Rightarrow> int \<Rightarrow> _"
  where "min_dist w1 w2 n \<longleftrightarrow> dist w1 w2 n \<and> (\<forall>(m :: int). dist w1 w2 m \<longrightarrow> n \<le> m)" for w1 w2 n
fun last_char :: "char \<Rightarrow> char list \<Rightarrow> char"
  where "last_char a (Nil :: char list) = a" for a
      | "last_char a (Cons c u') = last_char c u'" for a c u'
fun but_last :: "char \<Rightarrow> char list \<Rightarrow> char list"
  where "but_last a (Nil :: char list) = (Nil :: char list)" for a
      | "but_last a (Cons c u') = Cons a (but_last c u')" for a c u'
theorem key_lemma_left'vc:
  fixes a :: "char"
  fixes w1 :: "char list"
  fixes w2 :: "char list"
  fixes m :: "int"
  assumes fact0: "dist (Cons a w1) w2 m"
  shows "\<exists>(u2 :: char list) (v2 :: char list) (k :: int). w2 = u2 @ v2 \<and> dist w1 v2 k \<and> k + int (length u2) \<le> m + (1 :: int)"
  sorry
end
