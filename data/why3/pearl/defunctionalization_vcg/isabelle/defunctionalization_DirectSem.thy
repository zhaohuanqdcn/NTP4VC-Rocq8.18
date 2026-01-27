theory defunctionalization_DirectSem
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr"
begin
fun eval_0 :: "expr \<Rightarrow> int"
  where "eval_0 (Cte n) = n" for n
      | "eval_0 (Sub e1 e2) = eval_0 e1 - eval_0 e2" for e1 e2
end
