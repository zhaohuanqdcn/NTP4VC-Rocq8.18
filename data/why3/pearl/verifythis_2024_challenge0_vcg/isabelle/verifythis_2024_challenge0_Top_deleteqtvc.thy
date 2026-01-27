theory verifythis_2024_challenge0_Top_deleteqtvc
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
theorem delete'vc:
  fixes r :: "rope"
  fixes i :: "int"
  fixes len :: "int"
  assumes fact0: "valid r"
  assumes fact1: "(0 :: int) \<le> i"
  assumes fact2: "i \<le> int (length (to_str r))"
  assumes fact3: "(0 :: int) \<le> len"
  assumes fact4: "len \<le> int (length (to_str r)) - i"
  shows "valid r"
  and "(0 :: int) \<le> i"
  and "i \<le> int (length (to_str r))"
  and "\<forall>(left1 :: rope) (remaining :: rope). valid left1 \<and> valid remaining \<and> to_str r = to_str left1 @ to_str remaining \<and> int (length (to_str left1)) = i \<longrightarrow> ((valid remaining \<and> (0 :: int) \<le> len \<and> len \<le> int (length (to_str remaining))) \<and> (\<forall>(o1 :: rope) (right1 :: rope). valid o1 \<and> valid right1 \<and> to_str remaining = to_str o1 @ to_str right1 \<and> int (length (to_str o1)) = len \<longrightarrow> valid left1 \<and> valid right1)) \<and> (\<forall>(result :: rope). (\<exists>(left2 :: rope) (right1 :: rope). (valid left2 \<and> valid right1 \<and> to_str remaining = to_str left2 @ to_str right1 \<and> int (length (to_str left2)) = len) \<and> valid result \<and> to_str result = to_str left1 @ to_str right1) \<longrightarrow> valid result \<and> to_str result = take (nat i) (to_str r) @ drop (nat (i + len)) (to_str r))"
  sorry
end
