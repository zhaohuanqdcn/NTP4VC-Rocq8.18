import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.matrix.Matrix63
import Why3.debug.Debug
import pearl.multiprecision.lib.lean.lineardecision.RationalCoeffs
import pearl.multiprecision.lib.lean.lineardecision.MP64Coeffs
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionRationalMP
import pearl.multiprecision.lib.lean.lineardecision.LinearDecisionIntMP
open Classical
open Lean4Why3
namespace lineardecision_EqPropMP_max_var_ctxqtqtvc
noncomputable def expr_bound' : LinearDecisionIntMP.expr' -> ℤ -> Prop
  | (LinearDecisionIntMP.expr'.Sum e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.Diff e1 e2), b => expr_bound' e1 b ∧ expr_bound' e2 b
  | (LinearDecisionIntMP.expr'.ProdL e1 x), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.ProdR x e1), b => expr_bound' e1 b
  | (LinearDecisionIntMP.expr'.Var n), b => (0 : ℤ) ≤ n ∧ n ≤ b
  | (LinearDecisionIntMP.expr'.Coeff x), b => True
noncomputable def eq_bound' (eq : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (b : ℤ) := match eq with | (e1, e2) => expr_bound' e1 b ∧ expr_bound' e2 b
noncomputable def ctx_bound' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> ℤ -> Prop
  | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')), b => True
  | (List.cons eq t), b => eq_bound' eq b ∧ ctx_bound' t b
axiom max_var' : LinearDecisionIntMP.expr' -> ℤ
axiom max_var''def (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : match e with | LinearDecisionIntMP.expr'.Var i => max_var' e = i | LinearDecisionIntMP.expr'.Coeff _ => max_var' e = (0 : ℤ) | LinearDecisionIntMP.expr'.Sum e1 e2 => max_var' e = max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.expr'.Diff e1 e2 => max_var' e = max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.expr'.ProdL e1 _ => max_var' e = max_var' e1 | LinearDecisionIntMP.expr'.ProdR _ e1 => max_var' e = max_var' e1
axiom max_var''spec'0 (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : (0 : ℤ) ≤ max_var' e
axiom max_var''spec (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : expr_bound' e (max_var' e)
axiom max_var_e' : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' -> ℤ
axiom max_var_e''def (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : match e with | (e1, e2) => max_var_e' e = max (max_var' e1) (max_var' e2)
axiom max_var_e''spec'0 (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : (0 : ℤ) ≤ max_var_e' e
axiom max_var_e''spec (e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e) : eq_bound' e (max_var_e' e)
theorem max_var_ctx''vc (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : (match l with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => True | List.cons e t => ((match l with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => False | List.cons _ f => f = t) ∧ LinearDecisionIntMP.valid_ctx' t) ∧ (∀(o1 : ℤ), (0 : ℤ) ≤ o1 ∧ ctx_bound' t o1 → LinearDecisionIntMP.valid_eq' e)) ∧ (∀(result : ℤ), (match l with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => result = (0 : ℤ) | List.cons e t => (∃(o1 : ℤ), ((0 : ℤ) ≤ o1 ∧ ctx_bound' t o1) ∧ (let o2 : ℤ := max_var_e' e; ((0 : ℤ) ≤ o2 ∧ eq_bound' e o2) ∧ result = max o2 o1))) → (0 : ℤ) ≤ result ∧ ctx_bound' l result)
  := sorry
end lineardecision_EqPropMP_max_var_ctxqtqtvc
