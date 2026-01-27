theory verifythis_2024_challenge0_Top_test_deleteqtvc
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
consts is_short :: "char list \<Rightarrow> bool"
consts char_l :: "char"
consts char_i :: "char"
consts char_z :: "char"
consts char_a :: "char"
consts char_r :: "char"
consts char_d :: "char"
theorem test_delete'vc:
  fixes r :: "rope"
  assumes fact0: "valid r"
  assumes fact1: "to_str r = Cons char_l (Cons char_i (Cons char_z (Cons char_a (Cons char_r (Cons char_d [])))))"
  shows "valid r"
  and "(0 :: int) \<le> (1 :: int)"
  and "(1 :: int) \<le> int (length (to_str r))"
  and "(0 :: int) \<le> (2 :: int)"
  and "(2 :: int) \<le> int (length (to_str r)) - (1 :: int)"
  and "\<forall>(result :: rope). valid result \<and> to_str result = take (1 :: nat) (to_str r) @ drop (nat ((1 :: int) + (2 :: int))) (to_str r) \<longrightarrow> to_str result = Cons char_l (Cons char_a (Cons char_r (Cons char_d [])))"
  sorry
end
