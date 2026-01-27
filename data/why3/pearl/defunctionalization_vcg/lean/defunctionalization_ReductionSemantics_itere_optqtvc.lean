import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
open Classical
open Lean4Why3
namespace defunctionalization_ReductionSemantics_itere_optqtvc
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
theorem itere_opt'vc (c1 : context) (e : Expr.expr) : (∀(c : context) (r : Expr.expr), recompose c r = recompose c1 e ∧ is_a_redex r → is_a_redex r ∧ (∀(o1 : Expr.expr), DirectSem.eval_0 o1 = DirectSem.eval_0 r → DirectSem.eval_0 (recompose c o1) = DirectSem.eval_0 (recompose c1 e))) ∧ (is_empty_context c1 ∧ is_a_value e → (match e with | Expr.expr.Cte n => True | _ => False) ∧ (∀(result : ℤ), (match e with | Expr.expr.Cte n => result = n | _ => False) → result = DirectSem.eval_0 (recompose c1 e)))
  := sorry
end defunctionalization_ReductionSemantics_itere_optqtvc
