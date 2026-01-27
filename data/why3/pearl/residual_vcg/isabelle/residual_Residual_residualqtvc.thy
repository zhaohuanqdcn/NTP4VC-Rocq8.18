theory residual_Residual_residualqtvc
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
theorem residual'vc:
  fixes r :: "regexp"
  fixes c :: "char"
  shows "case r of (Empty :: regexp) \<Rightarrow> True | Epsilon \<Rightarrow> True | Char c' \<Rightarrow> True | Alt r1 r2 \<Rightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Concat f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Star f \<Rightarrow> f = r2) \<and> (\<forall>(o1 :: regexp). (\<forall>(w :: char list). mem w o1 \<longleftrightarrow> mem (Cons c w) r2) \<longrightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Concat f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Star f \<Rightarrow> f = r1)) | Concat r1 r2 \<Rightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Concat f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Star f \<Rightarrow> f = r1) \<and> (\<forall>(r1' :: regexp). (\<forall>(w :: char list). mem w r1' \<longleftrightarrow> mem (Cons c w) r1) \<longrightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Concat f f1 \<Rightarrow> f = r2 \<or> f1 = r2 | Star f \<Rightarrow> f = r2)) | Star r1 \<Rightarrow> (case r of (Empty :: regexp) \<Rightarrow> False | Epsilon \<Rightarrow> False | Char _ \<Rightarrow> False | Alt f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Concat f f1 \<Rightarrow> f = r1 \<or> f1 = r1 | Star f \<Rightarrow> f = r1)"
  and "\<forall>(result :: regexp). (case r of (Empty :: regexp) \<Rightarrow> result = (Empty :: regexp) | Epsilon \<Rightarrow> result = (Empty :: regexp) | Char c' \<Rightarrow> (eq c c' \<longleftrightarrow> c = c') \<and> (if eq c c' then result = Epsilon else result = (Empty :: regexp)) | Alt r1 r2 \<Rightarrow> (\<exists>(o1 :: regexp). (\<forall>(w :: char list). mem w o1 \<longleftrightarrow> mem (Cons c w) r2) \<and> (\<exists>(o2 :: regexp). (\<forall>(w :: char list). mem w o2 \<longleftrightarrow> mem (Cons c w) r1) \<and> (\<forall>(w :: char list). mem w result \<longleftrightarrow> mem w (Alt o2 o1)))) | Concat r1 r2 \<Rightarrow> (\<exists>(r1' :: regexp). (\<forall>(w :: char list). mem w r1' \<longleftrightarrow> mem (Cons c w) r1) \<and> (\<exists>(r2' :: regexp). (\<forall>(w :: char list). mem w r2' \<longleftrightarrow> mem (Cons c w) r2) \<and> (if mem [] r1 then \<exists>(o1 :: regexp). (\<forall>(w :: char list). mem w o1 \<longleftrightarrow> mem w (Concat r1' r2)) \<and> (\<forall>(w :: char list). mem w result \<longleftrightarrow> mem w (Alt o1 r2')) else \<forall>(w :: char list). mem w result \<longleftrightarrow> mem w (Concat r1' r2)))) | Star r1 \<Rightarrow> (\<exists>(o1 :: regexp). (\<forall>(w :: char list). mem w o1 \<longleftrightarrow> mem (Cons c w) r1) \<and> (\<forall>(w :: char list). mem w result \<longleftrightarrow> mem w (Concat o1 r)))) \<longrightarrow> (\<forall>(w :: char list). mem w result \<longleftrightarrow> mem (Cons c w) r)"
  sorry
end
