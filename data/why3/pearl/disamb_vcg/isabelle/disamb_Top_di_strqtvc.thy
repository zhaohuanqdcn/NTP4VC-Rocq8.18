theory disamb_Top_di_strqtvc
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
theorem di_str'vc:
  fixes e :: "token list"
  fixes n :: "int"
  assumes fact0: "int (length e) \<le> n \<and> pt e \<or> int (length e) < n \<and> pe' e"
  shows "pe e"
  sorry
end
