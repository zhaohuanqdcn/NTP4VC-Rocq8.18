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
namespace lineardecision_EqPropMP_max_var_eqtqtvc
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
theorem max_var_e''vc (e1 : LinearDecisionIntMP.expr') (e2 : LinearDecisionIntMP.expr') : let e : LinearDecisionIntMP.expr' × LinearDecisionIntMP.expr' := (e1, e2); LinearDecisionIntMP.valid_eq' e → (LinearDecisionIntMP.valid_expr' e2 ∧ (let o1 : ℤ := max_var' e2; (0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1 → LinearDecisionIntMP.valid_expr' e1)) ∧ (∀(result : ℤ), (let o1 : ℤ := max_var' e2; ((0 : ℤ) ≤ o1 ∧ expr_bound' e2 o1) ∧ (let o2 : ℤ := max_var' e1; ((0 : ℤ) ≤ o2 ∧ expr_bound' e1 o2) ∧ result = max o2 o1)) → (0 : ℤ) ≤ result ∧ eq_bound' e result)
  := sorry
end lineardecision_EqPropMP_max_var_eqtqtvc
