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
Theorem expr_bound''vc (e : LinearDecisionIntMP.expr') : match e with | LinearDecisionIntMP.Sum e1 e2 => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ (match e with | LinearDecisionIntMP.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.ProdL f _ => f = e2 | LinearDecisionIntMP.ProdR _ f => f = e2 | LinearDecisionIntMP.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) | LinearDecisionIntMP.Diff e1 e2 => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) ∧ (match e with | LinearDecisionIntMP.Sum f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.ProdL f _ => f = e2 | LinearDecisionIntMP.ProdR _ f => f = e2 | LinearDecisionIntMP.Diff f f1 => f = e2 ∨ f1 = e2 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) | LinearDecisionIntMP.ProdL e1 _ => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) | LinearDecisionIntMP.ProdR _ e1 => (match e with | LinearDecisionIntMP.Sum f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.ProdL f _ => f = e1 | LinearDecisionIntMP.ProdR _ f => f = e1 | LinearDecisionIntMP.Diff f f1 => f = e1 ∨ f1 = e1 | LinearDecisionIntMP.Var _ => False | LinearDecisionIntMP.Coeff _ => False end) | LinearDecisionIntMP.Var n => True | LinearDecisionIntMP.Coeff _ => True end.
Admitted.
