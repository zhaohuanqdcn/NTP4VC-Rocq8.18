import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
open Classical
open Lean4Why3
namespace defunctionalization_ReductionSemantics_eval_2qtvc
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
noncomputable def is_a_value (e : Expr.expr) := match e with | Expr.expr.Cte _ => True | _ => False
noncomputable def is_empty_context (c : context) := match c with | context.Empty => True | _ => False
noncomputable def size_c : context -> ℤ
  | context.Empty => (0 : ℤ)
  | (context.Left c1 e) => (2 : ℤ) + size_c c1 + Defunctionalization.size_e e
  | (context.Right x c1) => (1 : ℤ) + size_c c1
theorem eval_2'vc (c : context) (n : ℤ) : (match c with | context.Empty => True | context.Left c1 e => (0 : ℤ) ≤ (1 : ℤ) + (2 : ℤ) * size_c c ∧ (2 : ℤ) * (size_c (context.Right n c1) + Defunctionalization.size_e e) < (1 : ℤ) + (2 : ℤ) * size_c c | context.Right n1 c1 => (0 : ℤ) ≤ (1 : ℤ) + (2 : ℤ) * size_c c ∧ (2 : ℤ) * (size_c c1 + Defunctionalization.size_e (Expr.expr.Cte (n1 - n))) < (1 : ℤ) + (2 : ℤ) * size_c c) ∧ (∀(result : ℤ), (match c with | context.Empty => result = n | context.Left c1 e => result = DirectSem.eval_0 (recompose (context.Right n c1) e) | context.Right n1 c1 => result = DirectSem.eval_0 (recompose c1 (Expr.expr.Cte (n1 - n)))) → result = DirectSem.eval_0 (recompose c (Expr.expr.Cte n)))
  := sorry
end defunctionalization_ReductionSemantics_eval_2qtvc
