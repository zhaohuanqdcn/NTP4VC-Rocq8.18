import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
import pearl.defunctionalization_vcg.lean.defunctionalization.SemWithError
open Classical
open Lean4Why3
namespace defunctionalization_RWithError_recompose_valuesqtvc
inductive context where
  | Empty : context
  | Left : context -> Expr.expr -> context
  | Right : ℤ -> context -> context
axiom inhabited_axiom_context : Inhabited context
attribute [instance] inhabited_axiom_context
noncomputable def size_c : context -> ℤ
  | context.Empty => (0 : ℤ)
  | (context.Left c1 e) => (2 : ℤ) + size_c c1 + Defunctionalization.size_e e
  | (context.Right x c1) => (1 : ℤ) + size_c c1
noncomputable def recompose : context -> Expr.expr -> Expr.expr
  | context.Empty, e => e
  | (context.Left c1 e2), e => recompose c1 (Expr.expr.Sub e e2)
  | (context.Right n1 c1), e => recompose c1 (Expr.expr.Sub (Expr.expr.Cte n1) e)
theorem recompose_values'vc (e1 : Expr.expr) (e2 : Expr.expr) (c : context) (fact0 : SemWithError.eval_0 e1 = SemWithError.eval_0 e2) : SemWithError.eval_0 (recompose c e1) = SemWithError.eval_0 (recompose c e2)
  := sorry
end defunctionalization_RWithError_recompose_valuesqtvc
