theory toy_compiler_Compiler_soundnessqtvc
  imports "NTP4Verif.NTP4Verif" "./toy_compiler_Expr" "./toy_compiler_StackMachine"
begin
fun compile :: "expr \<Rightarrow> asm list"
  where "compile (Cte n) = Cons (Push n) (Nil :: asm list)" for n
      | "compile (Plus e1 e2) = compile e1 @ compile e2 @ Cons Add (Nil :: asm list)" for e1 e2
      | "compile (Minus e1 e2) = compile e1 @ compile e2 @ Cons Sub (Nil :: asm list)" for e1 e2
      | "compile (Mult e1 e2) = compile e1 @ compile e2 @ Cons Mul (Nil :: asm list)" for e1 e2
theorem soundness'vc:
  fixes e :: "expr"
  shows "compute (Nil :: int list) (compile e) = Cons (eval_expr e) (Nil :: int list)"
  sorry
end
