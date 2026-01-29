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
Require Import multiprecision.lineardecision.LinearDecisionRational.
Open Scope Z_scope.
Theorem g (x : R) (y : R) (fact0 : Rplus (Rmult (Rdiv (Rdefinitions.IZR 3%Z) (Rdefinitions.IZR 1%Z)) x) (Rmult (Rdiv (Rdefinitions.IZR 2%Z) (Rdefinitions.IZR 1%Z)) y) = Rdiv (Rdefinitions.IZR 21%Z) (Rdefinitions.IZR 1%Z)) (fact1 : Rplus (Rmult (Rdiv (Rdefinitions.IZR 7%Z) (Rdefinitions.IZR 1%Z)) x) (Rmult (Rdiv (Rdefinitions.IZR 4%Z) (Rdefinitions.IZR 1%Z)) y) = Rdiv (Rdefinitions.IZR 47%Z) (Rdefinitions.IZR 1%Z)) : x = Rdiv (Rdefinitions.IZR 5%Z) (Rdefinitions.IZR 1%Z).
Proof.
Admitted.
