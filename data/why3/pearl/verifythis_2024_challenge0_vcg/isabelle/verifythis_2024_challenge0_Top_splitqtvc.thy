theory verifythis_2024_challenge0_Top_splitqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
typedecl  str
datatype  rope = Leaf "char list" | Node "int" "rope" "rope"
fun to_str :: "rope \<Rightarrow> char list"
  where "to_str (Leaf s) = s" for s
      | "to_str (Node x rl rr) = to_str rl @ to_str rr" for x rl rr
fun valid :: "rope \<Rightarrow> _"
  where "valid (Leaf x_s) = True" for x_s
      | "valid (Node wl rl rr) = (wl = int (length (to_str rl)) \<and> valid rl \<and> valid rr)" for wl rl rr
theorem split'vc:
  fixes r :: "rope"
  fixes i :: "int"
  assumes fact0: "valid r"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> int (length (to_str r))"
  shows "case r of Leaf s \<Rightarrow> (0 :: int) \<le> i \<and> i \<le> int (length s) | Node wl rl rr \<Rightarrow> (if i < wl then ((case r of Leaf _ \<Rightarrow> False | Node _ f f1 \<Rightarrow> f = rl \<or> f1 = rl) \<and> valid rl \<and> (0 :: int) \<le> i \<and> i \<le> int (length (to_str rl))) \<and> (\<forall>(rll :: rope) (rlr :: rope). valid rll \<and> valid rlr \<and> to_str rl = to_str rll @ to_str rlr \<and> int (length (to_str rll)) = i \<longrightarrow> valid rlr \<and> valid rr) else wl < i \<longrightarrow> (let o1 :: int = i - wl in ((case r of Leaf _ \<Rightarrow> False | Node _ f f1 \<Rightarrow> f = rr \<or> f1 = rr) \<and> valid rr \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length (to_str rr))) \<and> (\<forall>(rrl :: rope) (rrr :: rope). valid rrl \<and> valid rrr \<and> to_str rr = to_str rrl @ to_str rrr \<and> int (length (to_str rrl)) = o1 \<longrightarrow> valid rl \<and> valid rrl)))"
  and "\<forall>(left1 :: rope) (right1 :: rope). (case r of Leaf s \<Rightarrow> left1 = Leaf (take (nat i) s) \<and> right1 = Leaf (drop (nat i) s) | Node wl rl rr \<Rightarrow> (if i < wl then \<exists>(right2 :: rope). (valid left1 \<and> valid right2 \<and> to_str rl = to_str left1 @ to_str right2 \<and> int (length (to_str left1)) = i) \<and> valid right1 \<and> to_str right1 = to_str right2 @ to_str rr else if wl < i then \<exists>(left2 :: rope). (valid left2 \<and> valid right1 \<and> to_str rr = to_str left2 @ to_str right1 \<and> int (length (to_str left2)) = i - wl) \<and> valid left1 \<and> to_str left1 = to_str rl @ to_str left2 else left1 = rl \<and> right1 = rr)) \<longrightarrow> valid left1 \<and> valid right1 \<and> to_str r = to_str left1 @ to_str right1 \<and> int (length (to_str left1)) = i"
  sorry
end
