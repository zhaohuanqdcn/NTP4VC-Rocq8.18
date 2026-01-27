From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.mach.matrix.Matrix63.
Require Import Why3.debug.Debug.
Require Import multiprecision.lineardecision.RationalCoeffs.
Require Import multiprecision.lineardecision.MP64Coeffs.
Require Import multiprecision.lineardecision.LinearDecisionRationalMP.
Require Import multiprecision.lineardecision.LinearDecisionIntMP.
Open Scope Z_scope.
Program Fixpoint expr_bound' (e : LinearDecisionIntMP.expr') (b : Z) : Prop :=
match e with | LinearDecisionIntMP.Sum e1 e2 => expr_bound' e1 b ∧ expr_bound' e2 b | LinearDecisionIntMP.Diff e1 e2 => expr_bound' e1 b ∧ expr_bound' e2 b | LinearDecisionIntMP.ProdL e1 _ => expr_bound' e1 b | LinearDecisionIntMP.ProdR _ e1 => expr_bound' e1 b | LinearDecisionIntMP.Var n => 0%Z ≤ n ∧ n ≤ b | LinearDecisionIntMP.Coeff _ => True end.
Admit Obligations.
Definition eq_bound' (eq : LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr') (b : Z) := match eq with | (e1, e2) => expr_bound' e1 b ∧ expr_bound' e2 b end.
Program Fixpoint ctx_bound' (ctx : list (LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr')) (b : Z) : Prop :=
match ctx with | [] => True | cons eq t => eq_bound' eq b ∧ ctx_bound' t b end.
Admit Obligations.
Axiom max_var' : LinearDecisionIntMP.expr' -> Z.
Axiom max_var''def : forall  (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e), match e with | LinearDecisionIntMP.Var i => max_var' e = i | LinearDecisionIntMP.Coeff _ => max_var' e = 0%Z | LinearDecisionIntMP.Sum e1 e2 => max_var' e = Z.max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.Diff e1 e2 => max_var' e = Z.max (max_var' e1) (max_var' e2) | LinearDecisionIntMP.ProdL e1 _ => max_var' e = max_var' e1 | LinearDecisionIntMP.ProdR _ e1 => max_var' e = max_var' e1 end.
Axiom max_var''spec'0 : forall  (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e), 0%Z ≤ max_var' e.
Axiom max_var''spec : forall  (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e), expr_bound' e (max_var' e).
Axiom max_var_e' : LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr' -> Z.
Axiom max_var_e''def : forall  (e : LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e), match e with | (e1, e2) => max_var_e' e = Z.max (max_var' e1) (max_var' e2) end.
Axiom max_var_e''spec'0 : forall  (e : LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e), 0%Z ≤ max_var_e' e.
Axiom max_var_e''spec : forall  (e : LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_eq' e), eq_bound' e (max_var_e' e).
Theorem max_var_ctx''vc (l : list (LinearDecisionIntMP.expr' * LinearDecisionIntMP.expr')) (fact0 : LinearDecisionIntMP.valid_ctx' l) : (match l with | [] => True | cons e t => ((match l with | [] => False | cons _ f => f = t end) ∧ LinearDecisionIntMP.valid_ctx' t) ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ ctx_bound' t o1 -> LinearDecisionIntMP.valid_eq' e) end) ∧ (∀(result : Z), (match l with | [] => result = 0%Z | cons e t => (∃(o1 : Z), (0%Z ≤ o1 ∧ ctx_bound' t o1) ∧ (let o2 : Z := max_var_e' e in (0%Z ≤ o2 ∧ eq_bound' e o2) ∧ result = Z.max o2 o1)) end) -> 0%Z ≤ result ∧ ctx_bound' l result).
Admitted.
