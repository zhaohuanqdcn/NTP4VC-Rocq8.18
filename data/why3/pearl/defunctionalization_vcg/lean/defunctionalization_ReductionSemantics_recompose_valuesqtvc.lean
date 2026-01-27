import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_ReductionSemantics_recompose_valuesqtvc
noncomputable def is_a_redex (e : Expr.expr) := match e with | Expr.expr.Sub (Expr.expr.Cte _) (Expr.expr.Cte _) => True | _ => False
inductive context where
  | Empty : context
  | Left : context -> Expr.expr -> context
  | Right : ℤ -> context -> context
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def recompose : context -> Expr.expr -> Expr.expr
  | context.Empty, e => e
  | (context.Left c1 e2), e => recompose c1 (Expr.expr.Sub e e2)
  | (context.Right n1 c1), e => recompose c1 (Expr.expr.Sub (Expr.expr.Cte n1) e)
theorem recompose_values'vc (e1 : Expr.expr) (e2 : Expr.expr) (c : context) (fact0 : DirectSem.eval_0 e1 = DirectSem.eval_0 e2) : DirectSem.eval_0 (recompose c e1) = DirectSem.eval_0 (recompose c e2)
  := sorry
end defunctionalization_ReductionSemantics_recompose_valuesqtvc
