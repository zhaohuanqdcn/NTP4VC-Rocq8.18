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
Theorem expr_bound_w''vc (b1 : Z) (b2 : Z) (e : LinearDecisionIntMP.expr') (fact0 : b1 ≤ b2) (fact1 : expr_bound' e b1) : expr_bound' e b2.
Admitted.
