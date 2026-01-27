theory dfa_example_DfaExample
  imports "NTP4Verif.NTP4Verif"
begin
datatype  char = Zero | One
datatype  regexp = Empty | Epsilon | Char "char" | Alt "regexp" "regexp" | Concat "regexp" "regexp" | Star "regexp"
inductive mem :: "char list \<Rightarrow> regexp \<Rightarrow> bool" where
   mem_eps: "mem [] Epsilon"
 | mem_char: "mem [c] (Char c)" for c :: "char"
 | mem_altl: "mem w r11 \<Longrightarrow> mem w (Alt r11 r21)" for w :: "char list" and r11 :: "regexp" and r21 :: "regexp"
 | mem_altr: "mem w r21 \<Longrightarrow> mem w (Alt r11 r21)" for w :: "char list" and r21 :: "regexp" and r11 :: "regexp"
 | mem_concat: "mem w1 r11 \<Longrightarrow> mem w2 r21 \<Longrightarrow> mem (w1 @ w2) (Concat r11 r21)" for w1 :: "char list" and r11 :: "regexp" and w2 :: "char list" and r21 :: "regexp"
 | mems1: "mem [] (Star r)" for r :: "regexp"
 | mems2: "mem w1 r \<Longrightarrow> mem w2 (Star r) \<Longrightarrow> mem (w1 @ w2) (Star r)" for w1 :: "char list" and r :: "regexp" and w2 :: "char list"
typedecl  stream
consts state :: "stream \<Rightarrow> char list"
end
