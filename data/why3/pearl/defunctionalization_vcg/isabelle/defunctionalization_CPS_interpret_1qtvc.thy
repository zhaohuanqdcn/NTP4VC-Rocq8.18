theory defunctionalization_CPS_interpret_1qtvc
  imports "NTP4Verif.NTP4Verif" "./defunctionalization_Expr" "./defunctionalization_DirectSem"
begin
consts identity :: "int \<Rightarrow> int"
axiomatization where identity_def:   "identity y = y"
  for y :: "int"
theorem interpret_1'vc:
  fixes p :: "expr"
  shows "identity (eval_0 p) = eval_0 p"
  sorry
end
