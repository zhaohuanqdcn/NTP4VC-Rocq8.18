theory residual_ResidualOCaml_decideqtvc
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
typedecl  ostring
consts str :: "ostring \<Rightarrow> char list"
theorem decide'vc:
  fixes o1 :: "63 word"
  fixes w :: "ostring"
  fixes r :: "regexp"
  assumes fact0: "sint o1 = int (length (str w))"
  assumes fact1: "(0 :: int) \<le> int (length (str w))"
  shows "int'63_in_bounds (sint o1 - (1 :: int))"
  and "\<forall>(o2 :: 63 word). sint o2 = sint o1 - (1 :: int) \<longrightarrow> ((0 :: int) \<le> sint o2 + (1 :: int) \<longrightarrow> (mem (drop (0 :: nat) (str w)) r \<longleftrightarrow> mem (str w) r) \<and> (\<forall>(r' :: regexp). (\<forall>(i :: 63 word). let i1 :: int = sint i in ((0 :: int) \<le> i1 \<and> i1 \<le> sint o2) \<and> (mem (drop (nat i1) (str w)) r' \<longleftrightarrow> mem (str w) r) \<longrightarrow> ((0 :: int) \<le> sint i \<and> sint i < int (length (str w))) \<and> (\<forall>(o3 :: regexp). (\<forall>(w1 :: char list). mem w1 o3 \<longleftrightarrow> mem (Cons (str w ! nat (sint i)) w1) r') \<longrightarrow> mem (drop (nat (i1 + (1 :: int))) (str w)) o3 \<longleftrightarrow> mem (str w) r)) \<and> ((mem (drop (nat (sint o2 + (1 :: int))) (str w)) r' \<longleftrightarrow> mem (str w) r) \<longrightarrow> mem [] r' \<longleftrightarrow> mem (str w) r))) \<and> (sint o2 + (1 :: int) < (0 :: int) \<longrightarrow> mem [] r \<longleftrightarrow> mem (str w) r)"
  sorry
end
