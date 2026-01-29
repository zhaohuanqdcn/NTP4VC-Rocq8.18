From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
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
Theorem max_var''vc (e : LinearDecisionIntMP.expr') (fact0 : LinearDecisionIntMP.valid_expr' e) : (match e with | LinearDecisionIntMP.Var i => True | LinearDecisionIntMP.Coeff _ => True | LinearDecisionIntMP.Sum e1 e2 => ((match e with | LinearDecisionIntMP.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.ProdL f _ => f = e2 | LinearDecisionIntMP.ProdR _ f => f = e2 | LinearDecisionIntMP.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ expr_bound' e2 o1 -> (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e1) | LinearDecisionIntMP.Diff e1 e2 => ((match e with | LinearDecisionIntMP.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.ProdL f _ => f = e2 | LinearDecisionIntMP.ProdR _ f => f = e2 | LinearDecisionIntMP.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e2) ∧ (∀(o1 : Z), 0%Z ≤ o1 ∧ expr_bound' e2 o1 -> (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e1) | LinearDecisionIntMP.ProdL e1 _ => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e1 | LinearDecisionIntMP.ProdR _ e1 => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ LinearDecisionIntMP.valid_expr' e1 end) ∧ (∀(result : Z), (match e with | LinearDecisionIntMP.Var i => result = i | LinearDecisionIntMP.Coeff _ => result = 0%Z | LinearDecisionIntMP.Sum e1 e2 => (∃(o1 : Z), (0%Z ≤ o1 ∧ expr_bound' e2 o1) ∧ (∃(o2 : Z), (0%Z ≤ o2 ∧ expr_bound' e1 o2) ∧ result = Z.max o2 o1)) | LinearDecisionIntMP.Diff e1 e2 => (∃(o1 : Z), (0%Z ≤ o1 ∧ expr_bound' e2 o1) ∧ (∃(o2 : Z), (0%Z ≤ o2 ∧ expr_bound' e1 o2) ∧ result = Z.max o2 o1)) | LinearDecisionIntMP.ProdL e1 _ => 0%Z ≤ result ∧ expr_bound' e1 result | LinearDecisionIntMP.ProdR _ e1 => 0%Z ≤ result ∧ expr_bound' e1 result end) -> 0%Z ≤ result ∧ expr_bound' e result).
Proof.
Admitted.
