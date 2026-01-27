theory disamb_Top_decomp_last_plusqtvc
  imports "NTP4Verif.NTP4Verif"
begin
datatype  token = INTERGER | PLUS | LPAREN | RPAREN
inductive pe :: "token list \<Rightarrow> bool" where
   Plus: "pe e1 \<Longrightarrow> pe e2 \<Longrightarrow> pe (e1 @ Cons PLUS e2)" for e1 :: "token list" and e2 :: "token list"
 | Paren: "pe e \<Longrightarrow> pe (Cons LPAREN (e @ Cons RPAREN (Nil :: token list)))" for e :: "token list"
 | Int: "pe (Cons INTERGER (Nil :: token list))"
inductive pe' :: "token list \<Rightarrow> bool" and pt :: "token list \<Rightarrow> bool" where
   Plus': "pe' e1 \<Longrightarrow> pt e2 \<Longrightarrow> pe' (e1 @ Cons PLUS e2)" for e1 :: "token list" and e2 :: "token list"
 | T': "pt t \<Longrightarrow> pe' t" for t :: "token list"
 | Paren': "pe' e \<Longrightarrow> pt (Cons LPAREN (e @ Cons RPAREN (Nil :: token list)))" for e :: "token list"
 | Int': "pt (Cons INTERGER (Nil :: token list))"
theorem decomp_last_plus'vc:
  fixes n :: "int"
  fixes m :: "int"
  fixes e :: "token list"
  assumes fact0: "n \<le> m"
  assumes fact1: "int (length e) \<le> n"
  assumes fact2: "pe e"
  assumes fact3: "\<not>pt e"
  shows "\<exists>(e1 :: token list) (e2 :: token list). pe e1 \<and> pt e2 \<and> e = e1 @ Cons PLUS e2"
  sorry
end
