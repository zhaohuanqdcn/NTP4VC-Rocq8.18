theory verifythis_2024_challenge0_Top_str_lenqtvc
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
theorem str_len'vc:
  fixes r :: "rope"
  assumes fact0: "valid r"
  shows "case r of Leaf s \<Rightarrow> True | Node wl _ rr \<Rightarrow> (case r of Leaf _ \<Rightarrow> False | Node _ f f1 \<Rightarrow> f = rr \<or> f1 = rr) \<and> valid rr"
  and "\<forall>(result :: int). (case r of Leaf s \<Rightarrow> result = int (length s) | Node wl _ rr \<Rightarrow> result = wl + int (length (to_str rr))) \<longrightarrow> result = int (length (to_str r))"
  sorry
end
