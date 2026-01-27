theory defunctionalization_ReductionSemantics_contractqtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem"
begin
definition is_a_redex :: "expr \<Rightarrow> _"
  where "is_a_redex e \<longleftrightarrow> (case e of Sub (Cte _) (Cte _) \<Rightarrow> True | _ \<Rightarrow> False)" for e
theorem contract'vc:
  fixes e :: "expr"
  assumes fact0: "is_a_redex e"
  shows "case e of Sub (Cte v1) (Cte v2) \<Rightarrow> True | _ \<Rightarrow> False"
  and "\<forall>(result :: expr). (case e of Sub (Cte v1) (Cte v2) \<Rightarrow> result = Cte (v1 - v2) | _ \<Rightarrow> False) \<longrightarrow> eval_0 result = eval_0 e"
  sorry
end
