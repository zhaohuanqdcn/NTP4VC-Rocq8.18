import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
import pearl.defunctionalization_vcg.lean.defunctionalization.Defunctionalization
open Classical
open Lean4Why3
namespace defunctionalization_ReductionSemantics_decomposeqtvc
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
theorem decompose'vc (e : Expr.expr) : let o1 : context := context.Empty; (∀(c1 : context) (e1 : Expr.expr), recompose c1 e1 = recompose o1 e ∧ is_a_redex e1 → recompose c1 e1 = e ∧ is_a_redex e1) ∧ (is_empty_context o1 ∧ is_a_value e → is_a_value e)
  := sorry
end defunctionalization_ReductionSemantics_decomposeqtvc
