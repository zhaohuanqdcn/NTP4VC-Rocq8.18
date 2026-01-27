theory edit_distance_MyWord_key_lemma_rightqtvc
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
theorem key_lemma_right'vc:
  fixes w1 :: "char list"
  fixes w'2 :: "char list"
  fixes m :: "int"
  fixes a :: "char"
  fixes w2 :: "char list"
  assumes fact0: "dist w1 w'2 m"
  assumes fact1: "w'2 = Cons a w2"
  shows "\<exists>(u1 :: char list) (v1 :: char list) (k :: int). w1 = u1 @ v1 \<and> dist v1 w2 k \<and> k + int (length u1) \<le> m + (1 :: int)"
  sorry
end
