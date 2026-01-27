theory residual_Residual_decide_memqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
typedecl  char
consts eq :: "char \<Rightarrow> char \<Rightarrow> bool"
axiomatization where eq'spec:   "eq x y \<longleftrightarrow> x = y"
  for x :: "char"
  and y :: "char"
datatype  regexp = Empty | Epsilon | Char "char" | Alt "regexp" "regexp" | Concat "regexp" "regexp" | Star "regexp"
inductive mem :: "char list \<Rightarrow> regexp \<Rightarrow> bool" where
   mem_eps: "mem [] Epsilon"
 | mem_char: "mem [c] (Char c)" for c :: "char"
 | mem_altl: "mem w r1 \<Longrightarrow> mem w (Alt r1 r2)" for w :: "char list" and r1 :: "regexp" and r2 :: "regexp"
 | mem_altr: "mem w r2 \<Longrightarrow> mem w (Alt r1 r2)" for w :: "char list" and r2 :: "regexp" and r1 :: "regexp"
 | mem_concat: "mem w1 r1 \<Longrightarrow> mem w2 r2 \<Longrightarrow> mem (w1 @ w2) (Concat r1 r2)" for w1 :: "char list" and r1 :: "regexp" and w2 :: "char list" and r2 :: "regexp"
 | mems1: "mem [] (Star r)" for r :: "regexp"
 | mems2: "mem w1 r \<Longrightarrow> mem w2 (Star r) \<Longrightarrow> mem (w1 @ w2) (Star r)" for w1 :: "char list" and r :: "regexp" and w2 :: "char list"
theorem decide_mem'vc:
  fixes w :: "char list"
  fixes r :: "regexp"
  shows "let o1 :: int = int (length w) - (1 :: int) in ((0 :: int) \<le> o1 + (1 :: int) \<longrightarrow> (mem (drop (0 :: nat) w) r \<longleftrightarrow> mem w r) \<and> (\<forall>(r' :: regexp). (\<forall>(i :: int). ((0 :: int) \<le> i \<and> i \<le> o1) \<and> (mem (drop (nat i) w) r' \<longleftrightarrow> mem w r) \<longrightarrow> (\<forall>(o2 :: regexp). (\<forall>(w1 :: char list). mem w1 o2 \<longleftrightarrow> mem (Cons (w ! nat i) w1) r') \<longrightarrow> mem (drop (nat (i + (1 :: int))) w) o2 \<longleftrightarrow> mem w r)) \<and> ((mem (drop (nat (o1 + (1 :: int))) w) r' \<longleftrightarrow> mem w r) \<longrightarrow> mem [] r' \<longleftrightarrow> mem w r))) \<and> (o1 + (1 :: int) < (0 :: int) \<longrightarrow> mem [] r \<longleftrightarrow> mem w r)"
  sorry
end
