import Why3.Base
open Classical
open Lean4Why3
namespace Expr
inductive expr where
  | Cte : ℤ -> expr
  | Sub : expr -> expr -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
axiom prog : Type
axiom inhabited_axiom_prog : Inhabited prog
attribute [instance] inhabited_axiom_prog
end Expr
