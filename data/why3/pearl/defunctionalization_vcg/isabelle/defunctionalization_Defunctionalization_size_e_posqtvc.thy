theory defunctionalization_Defunctionalization_size_e_posqtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem"
begin
datatype  cont = A1 "expr" "cont" | A2 "int" "cont" | I
inductive eval_cont :: "cont \<Rightarrow> int \<Rightarrow> int \<Rightarrow> bool" where
   a1: "eval_cont (A2 v k) (eval_0 e2) r \<Longrightarrow> eval_cont (A1 e2 k) v r" for v :: "int" and k :: "cont" and e2 :: "expr" and r :: "int"
 | a2: "eval_cont k (v1 - v) r \<Longrightarrow> eval_cont (A2 v1 k) v r" for k :: "cont" and v1 :: "int" and v :: "int" and r :: "int"
 | a3: "eval_cont I v v" for v :: "int"
fun size_e :: "expr \<Rightarrow> int"
  where "size_e (Cte x) = (1 :: int)" for x
      | "size_e (Sub e1 e2) = (3 :: int) + size_e e1 + size_e e2" for e1 e2
theorem size_e_pos'vc:
  fixes e :: "expr"
  shows "(1 :: int) \<le> size_e e"
  sorry
end
