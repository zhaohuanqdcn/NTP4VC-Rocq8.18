theory residual_Residual_accepts_epsilonqtvc
  imports "NTP4Verif.NTP4Verif"
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
theorem accepts_epsilon'vc:
  fixes r :: "regexp"
  shows "case r of (Empty :: regexp) \<Rightarrow> True | Epsilon \<Rightarrow> True | Char _ \<Rightarrow> True | Alt r1 r2 \<Rightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Concat f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Star f \<Rightarrow> f = r1) \<and> (\<not>mem [] r1 \<longrightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Concat f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Star f \<Rightarrow> f = r2)) | Concat r1 r2 \<Rightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Concat f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Star f \<Rightarrow> f = r1) \<and> (mem [] r1 \<longrightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Concat f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Star f \<Rightarrow> f = r2)) | Star _ \<Rightarrow> True"
  and "\<forall>(result :: bool). (case r of (Empty :: regexp) \<Rightarrow> result = False | Epsilon \<Rightarrow> result = True | Char _ \<Rightarrow> result = False | Alt r1 r2 \<Rightarrow> (if mem [] r1 then result = True else result = (if mem [] r2 then True else False)) | Concat r1 r2 \<Rightarrow> (if mem [] r1 then result = (if mem [] r2 then True else False) else result = False) | Star _ \<Rightarrow> result = True) \<longrightarrow> result = True \<longleftrightarrow> mem [] r"
  sorry
end
