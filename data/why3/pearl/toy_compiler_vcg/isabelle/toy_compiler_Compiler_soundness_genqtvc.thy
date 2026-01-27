theory toy_compiler_Compiler_soundness_genqtvc
  imports "NTP4Verif.NTP4Verif" "./toy_compiler_Expr" "./toy_compiler_StackMachine"
begin
fun compile :: "expr \<Rightarrow> asm list"
  where "compile (Cte n) = Cons (Push n) (Nil :: asm list)" for n
      | "compile (Plus e1 e2) = compile e1 @ compile e2 @ Cons Add (Nil :: asm list)" for e1 e2
      | "compile (Minus e1 e2) = compile e1 @ compile e2 @ Cons Sub (Nil :: asm list)" for e1 e2
      | "compile (Mult e1 e2) = compile e1 @ compile e2 @ Cons Mul (Nil :: asm list)" for e1 e2
theorem soundness_gen'vc:
  fixes s :: "int list"
  fixes e :: "expr"
  fixes r :: "asm list"
  shows "compute s (compile e @ r) = compute (Cons (eval_expr e) s) r"
  sorry
end
