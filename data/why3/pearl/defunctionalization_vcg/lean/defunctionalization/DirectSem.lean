import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
open Classical
open Lean4Why3
namespace DirectSem
noncomputable def eval_0 : Expr.expr -> ℤ
  | (Expr.expr.Cte n) => n
  | (Expr.expr.Sub e1 e2) => eval_0 e1 - eval_0 e2
end DirectSem
