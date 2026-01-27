import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
import pearl.defunctionalization_vcg.lean.defunctionalization.SemWithError
open Classical
open Lean4Why3
namespace defunctionalization_RWithError_eval_2qtvc
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
theorem eval_2'vc (n : ℤ) (c : context) (fact0 : (0 : ℤ) ≤ n) : (match c with | context.Empty => True | context.Left c1 e => (0 : ℤ) ≤ (1 : ℤ) + (2 : ℤ) * size_c c ∧ (2 : ℤ) * (size_c (context.Right n c1) + Defunctionalization.size_e e) < (1 : ℤ) + (2 : ℤ) * size_c c | context.Right n1 c1 => n ≤ n1 → (0 : ℤ) ≤ (1 : ℤ) + (2 : ℤ) * size_c c ∧ (2 : ℤ) * (size_c c1 + Defunctionalization.size_e (Expr.expr.Cte (n1 - n))) < (1 : ℤ) + (2 : ℤ) * size_c c) ∧ (∀(result : SemWithError.value), (match c with | context.Empty => result = SemWithError.value.Vnum n | context.Left c1 e => result = SemWithError.eval_0 (recompose (context.Right n c1) e) | context.Right n1 c1 => (if n ≤ n1 then result = SemWithError.eval_0 (recompose c1 (Expr.expr.Cte (n1 - n))) else result = SemWithError.value.Underflow)) → result = SemWithError.eval_0 (recompose c (Expr.expr.Cte n)))
  := sorry
end defunctionalization_RWithError_eval_2qtvc
