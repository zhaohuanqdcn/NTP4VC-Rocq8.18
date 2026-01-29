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
Require Import Why3.int.NumOf.
Require Import Why3.mach.matrix.Matrix63.
Require Import Why3.debug.Debug.
Require Import multiprecision.lineardecision.RationalCoeffs.
Require Import multiprecision.lineardecision.MP64Coeffs.
Require Import multiprecision.lineardecision.LinearDecisionRationalMP.
Require Import multiprecision.lineardecision.LinearDecisionIntMP.
Require Import multiprecision.lineardecision.EqPropMP.
Open Scope Z_scope.
Theorem g'' (i : Z) (r : Z) (x : Z) (y : Z) (l : Z) (fact0 : 0%Z ≤ i) (fact1 : r + Z.pow (18446744073709551615%Z + 1%Z) i * 0%Z = x + y) : r + Z.pow (18446744073709551615%Z + 1%Z) i * l + Z.pow (18446744073709551615%Z + 1%Z) (i + 1%Z) * 0%Z = x + Z.pow (18446744073709551615%Z + 1%Z) i * l + y.
Proof.
Admitted.
