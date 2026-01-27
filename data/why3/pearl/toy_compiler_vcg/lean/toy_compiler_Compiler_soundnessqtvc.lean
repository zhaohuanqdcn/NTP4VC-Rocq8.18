import Why3.Base
import pearl.toy_compiler_vcg.lean.toy_compiler.Expr
import pearl.toy_compiler_vcg.lean.toy_compiler.StackMachine
open Classical
open Lean4Why3
namespace toy_compiler_Compiler_soundnessqtvc
noncomputable def compile : Expr.expr -> List StackMachine.asm
  | (Expr.expr.Cte n) => List.cons (StackMachine.asm.Push n) ([] : List StackMachine.asm)
  | (Expr.expr.Plus e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Add ([] : List StackMachine.asm)
  | (Expr.expr.Minus e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Sub ([] : List StackMachine.asm)
  | (Expr.expr.Mult e1 e2) => compile e1 ++ compile e2 ++ List.cons StackMachine.asm.Mul ([] : List StackMachine.asm)
theorem soundness'vc (e : Expr.expr) : StackMachine.compute ([] : List ℤ) (compile e) = List.cons (Expr.eval_expr e) ([] : List ℤ)
  := sorry
end toy_compiler_Compiler_soundnessqtvc
