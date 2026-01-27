theory defunctionalization_ReductionSemantics_recompose_valuesqtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem"
begin
definition is_a_redex :: "expr \<Rightarrow> _"
  where "is_a_redex e \<longleftrightarrow> (case e of Sub (Cte _) (Cte _) \<Rightarrow> True | _ \<Rightarrow> False)" for e
datatype  "context" = Empty | Left "context" "expr" | Right "int" "context"
fun recompose :: "context \<Rightarrow> expr \<Rightarrow> expr"
  where "recompose (Empty :: context) e = e" for e
      | "recompose (Left c1 e2) e = recompose c1 (Sub e e2)" for c1 e2 e
      | "recompose (Right n1 c1) e = recompose c1 (Sub (Cte n1) e)" for n1 c1 e
theorem recompose_values'vc:
  fixes e1 :: "expr"
  fixes e2 :: "expr"
  fixes c :: "context"
  assumes fact0: "eval_0 e1 = eval_0 e2"
  shows "eval_0 (recompose c e1) = eval_0 (recompose c e2)"
  sorry
end
