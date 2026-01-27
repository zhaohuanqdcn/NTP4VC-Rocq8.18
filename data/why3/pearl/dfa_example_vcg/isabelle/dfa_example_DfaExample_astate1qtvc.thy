theory dfa_example_DfaExample_astate1qtvc
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
theorem astate1'vc:
  fixes input :: "stream"
  fixes input1 :: "stream"
  fixes o1 :: "char option"
  assumes fact0: "if state input = [] then (state input = state input1 \<and> state input1 = []) \<and> o1 = None else state input1 = drop (1 :: nat) (state input) \<and> o1 = Some (state input ! (0 :: nat))"
  shows "case o1 of None \<Rightarrow> \<not>(state input1 = [] \<and> mem (state input) (Concat (Star (Alt (Char Zero) (Char One))) (Char One))) | Some Zero \<Rightarrow> ((0 :: int) \<le> int (length (state input)) \<and> length (state input1) < length (state input)) \<and> (\<forall>(input2 :: stream). state input2 = [] \<and> mem (state input1) (Concat (Star (Alt (Char Zero) (Char One))) (Char One)) \<longleftrightarrow> state input2 = [] \<and> mem (state input) (Concat (Star (Alt (Char Zero) (Char One))) (Char One))) | Some One \<Rightarrow> ((0 :: int) \<le> int (length (state input)) \<and> length (state input1) < length (state input)) \<and> (\<forall>(input2 :: stream). state input2 = [] \<and> mem (state input1) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One))) \<longleftrightarrow> state input2 = [] \<and> mem (state input) (Concat (Star (Alt (Char Zero) (Char One))) (Char One)))"
  sorry
end
