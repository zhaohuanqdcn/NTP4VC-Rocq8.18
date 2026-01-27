import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
open Classical
open Lean4Why3
namespace defunctionalization_DirectSem_eval_p3
noncomputable def eval_0 : Expr.expr -> ℤ
  | (Expr.expr.Cte n) => n
  | (Expr.expr.Sub e1 e2) => eval_0 e1 - eval_0 e2
theorem eval_p3 : eval_0 (Expr.expr.Sub (Expr.expr.Sub (Expr.expr.Cte (7 : ℤ)) (Expr.expr.Cte (2 : ℤ))) (Expr.expr.Sub (Expr.expr.Cte (10 : ℤ)) (Expr.expr.Cte (6 : ℤ)))) = (1 : ℤ)
  := sorry
end defunctionalization_DirectSem_eval_p3
