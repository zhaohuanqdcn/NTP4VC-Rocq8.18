import Why3.Base
import pearl.defunctionalization_vcg.lean.defunctionalization.Expr
import pearl.defunctionalization_vcg.lean.defunctionalization.DirectSem
open Classical
open Lean4Why3
namespace defunctionalization_CPS_eval_1qtvc
axiom o1 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> ℤ -> α
axiom result :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> ℤ -> α
axiom o2 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> Expr.expr -> ℤ -> α
axiom result1 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> ℤ -> α
axiom o3 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> Expr.expr -> ℤ -> α
axiom result2 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> ℤ -> α
axiom o4 :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> Expr.expr -> ℤ -> α
axiom o'def {α : Type} [Inhabited α] (k : ℤ -> α) (v1 : ℤ) (v2 : ℤ) : o1 k v1 v2 = k (v1 - v2)
axiom result'def {α : Type} [Inhabited α] (k : ℤ -> α) (v1 : ℤ) (v2 : ℤ) : result k v1 v2 = k (v1 - v2)
axiom o'def1 {α : Type} [Inhabited α] (k : ℤ -> α) (e2 : Expr.expr) (v1 : ℤ) : o2 k e2 v1 = result k v1 (DirectSem.eval_0 e2)
axiom result'def1 {α : Type} [Inhabited α] (k : ℤ -> α) (v1 : ℤ) (v2 : ℤ) : result1 k v1 v2 = k (v1 - v2)
axiom o'def2 {α : Type} [Inhabited α] (k : ℤ -> α) (e2 : Expr.expr) (v1 : ℤ) : o3 k e2 v1 = result1 k v1 (DirectSem.eval_0 e2)
axiom result'def2 {α : Type} [Inhabited α] (k : ℤ -> α) (v1 : ℤ) (v2 : ℤ) : result2 k v1 v2 = k (v1 - v2)
axiom o'def3 {α : Type} [Inhabited α] (k : ℤ -> α) (e2 : Expr.expr) (v1 : ℤ) : o4 k e2 v1 = result2 k v1 (DirectSem.eval_0 e2)
theorem eval_1'vc {α : Type} [Inhabited α] (e : Expr.expr) (k : ℤ -> α) : (match e with | Expr.expr.Cte n => True | Expr.expr.Sub e1 e2 => (match e with | Expr.expr.Cte _ => False | Expr.expr.Sub f f1 => f = e2 ∨ f1 = e2) ∧ (match e with | Expr.expr.Cte _ => False | Expr.expr.Sub f f1 => f = e1 ∨ f1 = e1)) ∧ (∀(result3 : α), (match e with | Expr.expr.Cte n => result3 = k n | Expr.expr.Sub e1 e2 => result3 = o4 k e2 (DirectSem.eval_0 e1)) → result3 = k (DirectSem.eval_0 e))
  := sorry
end defunctionalization_CPS_eval_1qtvc
