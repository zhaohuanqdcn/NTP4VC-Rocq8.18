theory dfa_example_DfaExample_zero_w_in_r2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  char = Zero | One
datatype  regexp = Empty | Epsilon | Char "char" | Alt "regexp" "regexp" | Concat "regexp" "regexp" | Star "regexp"
inductive mem :: "char list \<Rightarrow> regexp \<Rightarrow> bool" where
   mem_eps: "mem [] Epsilon"
 | mem_char: "mem [c] (Char c)" for c :: "char"
 | mem_altl: "mem w r1 \<Longrightarrow> mem w (Alt r1 r2)" for w :: "char list" and r1 :: "regexp" and r2 :: "regexp"
 | mem_altr: "mem w r2 \<Longrightarrow> mem w (Alt r1 r2)" for w :: "char list" and r2 :: "regexp" and r1 :: "regexp"
 | mem_concat: "mem w1 r1 \<Longrightarrow> mem w2 r2 \<Longrightarrow> mem (w1 @ w2) (Concat r1 r2)" for w1 :: "char list" and r1 :: "regexp" and w2 :: "char list" and r2 :: "regexp"
 | mems1: "mem [] (Star r)" for r :: "regexp"
 | mems2: "mem w1 r \<Longrightarrow> mem w2 (Star r) \<Longrightarrow> mem (w1 @ w2) (Star r)" for w1 :: "char list" and r :: "regexp" and w2 :: "char list"
typedecl  stream
consts state :: "stream \<Rightarrow> char list"
theorem zero_w_in_r2'vc:
  fixes w :: "char list"
  shows "mem w (Concat (Star (Alt (Char Zero) (Char One))) (Char One)) \<longleftrightarrow> mem (Cons Zero w) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One)))"
  sorry
end
