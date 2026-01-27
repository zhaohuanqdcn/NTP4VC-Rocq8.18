theory defunctionalization_Defunctionalization2_interpret_2qtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem"
begin
datatype  cont = A1 "expr" "cont" | A2 "int" "cont" | I
inductive eval_cont :: "cont \<Rightarrow> int \<Rightarrow> int \<Rightarrow> bool" where
   a1: "eval_cont (A2 v k) (eval_0 e2) r \<Longrightarrow> eval_cont (A1 e2 k) v r" for v :: "int" and k :: "cont" and e2 :: "expr" and r :: "int"
 | a2: "eval_cont k (v1 - v) r \<Longrightarrow> eval_cont (A2 v1 k) v r" for k :: "cont" and v1 :: "int" and v :: "int" and r :: "int"
 | a3: "eval_cont I v v" for v :: "int"
datatype  nat = S "nat" | O1
fun size_e :: "expr \<Rightarrow> nat \<Rightarrow> nat"
  where "size_e (Cte x) acc = S acc" for x acc
      | "size_e (Sub e1 e2) acc = S (size_e e1 (S (size_e e2 (S acc))))" for e1 e2 acc
fun size_c :: "cont \<Rightarrow> nat \<Rightarrow> nat"
  where "size_c I acc = acc" for acc
      | "size_c (A1 e2 k) acc = S (size_e e2 (S (size_c k acc)))" for e2 k acc
      | "size_c (A2 x k) acc = S (size_c k acc)" for x k acc
theorem interpret_2'vc:
  fixes p :: "expr"
  fixes result :: "int"
  assumes fact0: "eval_cont I (eval_0 p) result"
  shows "result = eval_0 p"
  sorry
end
