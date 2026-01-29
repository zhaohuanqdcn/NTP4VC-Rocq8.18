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
Open Scope Z_scope.
Axiom maxf : (Z -> Z) -> Z -> Z -> Z.
Axiom maxf'def : forall  (b : Z) (a : Z) (f : Z -> Z), if decide (b ≤ a) then maxf f a b = 0%Z else maxf f a b = Z.max (maxf f a (b - 1%Z)) (f (b - 1%Z)).
Theorem maxf_nonneg'vc (a : Z) (b : Z) (f : Z -> Z) (fact0 : a ≤ b) : 0%Z ≤ maxf f a b.
Proof.
Admitted.
