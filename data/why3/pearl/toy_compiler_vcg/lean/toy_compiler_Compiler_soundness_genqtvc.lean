import Why3.Base
import pearl.toy_compiler_vcg.lean.toy_compiler.Expr
import pearl.toy_compiler_vcg.lean.toy_compiler.StackMachine
open Classical
open Lean4Why3
namespace toy_compiler_Compiler_soundness_genqtvc
noncomputable def compile : Expr.expr -> List StackMachine.asm
  | (Expr.expr.Cte n) => List.cons (StackMachine.asm.Push n) ([] : List StackMachine.asm)
  | (Expr.expr.Plus e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Add ([] : List StackMachine.asm)
  | (Expr.expr.Minus e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Sub ([] : List StackMachine.asm)
  | (Expr.expr.Mult e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Mul ([] : List StackMachine.asm)
theorem soundness_gen'vc (s : List ℤ) (e : Expr.expr) (r : List StackMachine.asm) : StackMachine.compute s (compile e ++ r) = StackMachine.compute (List.cons (Expr.eval_expr e) s) r
  := sorry
end toy_compiler_Compiler_soundness_genqtvc
