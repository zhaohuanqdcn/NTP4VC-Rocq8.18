theory verifythis_2024_challenge0_Top_concatqtvc
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
theorem concat'vc:
  fixes left1 :: "rope"
  fixes right1 :: "rope"
  assumes fact0: "valid left1"
  assumes fact1: "valid right1"
  shows "valid left1"
  and "let result :: rope = Node (int (length (to_str left1))) left1 right1 in valid result \<and> to_str result = to_str left1 @ to_str right1"
  sorry
end
