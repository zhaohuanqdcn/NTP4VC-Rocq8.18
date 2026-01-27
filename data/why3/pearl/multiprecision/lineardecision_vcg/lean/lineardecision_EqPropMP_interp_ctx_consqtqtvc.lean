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
namespace lineardecision_EqPropMP_interp_ctx_consqtqtvc
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
axiom max_var_ctx' : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr') -> ℤ
axiom max_var_ctx''def (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : match l with | ([] : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) => max_var_ctx' l = (0 : ℤ) | List.cons e t => max_var_ctx' l = max (max_var_e' e) (max_var_ctx' t)
axiom max_var_ctx''spec'0 (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : (0 : ℤ) ≤ max_var_ctx' l
axiom max_var_ctx''spec (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : ctx_bound' l (max_var_ctx' l)
theorem interp_ctx_cons''vc (g : LinearDecisionIntMP.expr') (g1 : LinearDecisionIntMP.expr') (e : LinearDecisionIntMP.expr') (e1 : LinearDecisionIntMP.expr') (l : List (LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr')) : let g2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (g, g1); let e2 : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (e, e1); (∀(y : ℤ -> ℤ) (z : ℤ -> ℤ), LinearDecisionIntMP.interp_eq' e2 y z = true → LinearDecisionIntMP.interp_ctx' l g2 y z = true) → (∀(y : ℤ -> ℤ) (z : ℤ -> ℤ), LinearDecisionIntMP.interp_ctx' (List.cons e2 l) g2 y z = true)
  := sorry
end lineardecision_EqPropMP_interp_ctx_consqtqtvc
