theory defunctionalization_DirectSem_eval_p3
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr"
begin
fun eval_0 :: "expr \<Rightarrow> int"
  where "eval_0 (Cte n) = n" for n
      | "eval_0 (Sub e1 e2) = eval_0 e1 - eval_0 e2" for e1 e2
theorem eval_p3:
  shows "eval_0 (Sub (Sub (Cte (7 :: int)) (Cte (2 :: int))) (Sub (Cte (10 :: int)) (Cte (6 :: int)))) = (1 :: int)"
  sorry
end
