import Why3.Base
open Classical
open Lean4Why3
namespace Expr
inductive expr where
  | Cte : ℤ -> expr
  | Plus : expr -> expr -> expr
  | Minus : expr -> expr -> expr
  | Mult : expr -> expr -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
noncomputable def eval_expr : expr -> ℤ
  | (expr.Cte n) => n
  | (expr.Plus e1 e2) => eval_expr e1 + eval_expr e2
  | (expr.Minus e1 e2) => eval_expr e1 - eval_expr e2
  | (expr.Mult e1 e2) => eval_expr e1 * eval_expr e2
end Expr
