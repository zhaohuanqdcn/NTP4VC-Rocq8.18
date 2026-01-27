theory toy_compiler_Expr
  imports "NTP4Verif.NTP4Verif"
begin
datatype  expr = Cte "int" | Plus "expr" "expr" | Minus "expr" "expr" | Mult "expr" "expr"
fun eval_expr :: "expr \<Rightarrow> int"
  where "eval_expr (Cte n) = n" for n
      | "eval_expr (Plus e1 e2) = eval_expr e1 + eval_expr e2" for e1 e2
      | "eval_expr (Minus e1 e2) = eval_expr e1 - eval_expr e2" for e1 e2
      | "eval_expr (Mult e1 e2) = eval_expr e1 * eval_expr e2" for e1 e2
end
