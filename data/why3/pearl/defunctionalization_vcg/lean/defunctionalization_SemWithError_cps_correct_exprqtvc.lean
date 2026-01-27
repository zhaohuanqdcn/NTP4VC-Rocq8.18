import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
open Classical
open Lean4Why3
namespace defunctionalization_SemWithError_cps_correct_exprqtvc
inductive value where
  | Vnum : ℤ -> value
  | Underflow : value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
noncomputable def eval_0 : Expr.expr -> value
  | (Expr.expr.Cte n) => if (0 : ℤ) ≤ n then value.Vnum n else value.Underflow
  | (Expr.expr.Sub e1 e2) => match eval_0 e1 with | value.Underflow => value.Underflow | value.Vnum v1 => (match eval_0 e2 with | value.Underflow => value.Underflow | value.Vnum v2 => (if v2 ≤ v1 then value.Vnum (v1 - v2) else value.Underflow))
axiom fc :  {α : Type} -> [Inhabited α] -> (value -> α) -> ℤ -> value -> α
axiom fc1 :  {α : Type} -> [Inhabited α] -> (value -> α) -> Expr.expr -> value -> α
axiom fc'def {α : Type} [Inhabited α] (k : value -> α) (v1 : ℤ) (v2 : value) : fc k v1 v2 = (match v2 with | value.Underflow => k value.Underflow | value.Vnum v21 => k (if v21 ≤ v1 then value.Vnum (v1 - v21) else value.Underflow))
noncomputable def eval_1 {α : Type} [Inhabited α] : Expr.expr -> (value -> α) -> α
  | (Expr.expr.Cte n), k => k (if (0 : ℤ) ≤ n then value.Vnum n else value.Underflow)
  | (Expr.expr.Sub e1 e2), k => eval_1 e1 (fc1 k e2)
axiom fc'def1 {α : Type} [Inhabited α] (k : value -> α) (e2 : Expr.expr) (v1 : value) : fc1 k e2 v1 = (match v1 with | value.Underflow => k value.Underflow | value.Vnum v11 => eval_1 e2 (fc k v11))
axiom identity : value -> value
axiom identity_def (y : value) : identity y = y
noncomputable def interpret_1 (p : Expr.expr) := eval_1 p identity
theorem cps_correct_expr'vc {α : Type} [Inhabited α] (e : Expr.expr) (k : value -> α) : eval_1 e k = k (eval_0 e)
  := sorry
end defunctionalization_SemWithError_cps_correct_exprqtvc
