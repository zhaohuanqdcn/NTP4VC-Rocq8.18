import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
import pearl.defunctionalization_vcg.lean.defunctionalization.SemWithError
open Classical
open Lean4Why3
namespace defunctionalization_RWithError_eval_1qtvc
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
theorem eval_1'vc (e : Expr.expr) (c : context) : (match e with | Expr.expr.Cte n => (0 : ℤ) ≤ n → ((0 : ℤ) ≤ (2 : ℤ) * (size_c c + Defunctionalization.size_e e) ∧ (1 : ℤ) + (2 : ℤ) * size_c c < (2 : ℤ) * (size_c c + Defunctionalization.size_e e)) ∧ (0 : ℤ) ≤ n | Expr.expr.Sub e1 e2 => (0 : ℤ) ≤ (2 : ℤ) * (size_c c + Defunctionalization.size_e e) ∧ (2 : ℤ) * (size_c (context.Left c e2) + Defunctionalization.size_e e1) < (2 : ℤ) * (size_c c + Defunctionalization.size_e e)) ∧ (∀(result : SemWithError.value), (match e with | Expr.expr.Cte n => (if (0 : ℤ) ≤ n then result = SemWithError.eval_0 (recompose c (Expr.expr.Cte n)) else result = SemWithError.value.Underflow) | Expr.expr.Sub e1 e2 => result = SemWithError.eval_0 (recompose (context.Left c e2) e1)) → result = SemWithError.eval_0 (recompose c e))
  := sorry
end defunctionalization_RWithError_eval_1qtvc
