import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_ReductionSemantics_contractqtvc
noncomputable def is_a_redex (e : Expr.expr) := match e with | Expr.expr.Sub (Expr.expr.Cte _) (Expr.expr.Cte _) => True | _ => False
theorem contract'vc (e : Expr.expr) (fact0 : is_a_redex e) : (match e with | Expr.expr.Sub (Expr.expr.Cte v1) (Expr.expr.Cte v2) => True | _ => False) ∧ (∀(result : Expr.expr), (match e with | Expr.expr.Sub (Expr.expr.Cte v1) (Expr.expr.Cte v2) => result = Expr.expr.Cte (v1 - v2) | _ => False) → DirectSem.eval_0 result = DirectSem.eval_0 e)
  := sorry
end defunctionalization_ReductionSemantics_contractqtvc
