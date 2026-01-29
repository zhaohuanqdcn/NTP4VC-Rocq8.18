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
Axiom sum : (Z -> R) -> Z -> Z -> R.
Axiom sum'def : forall  (b : Z) (a : Z) (f : Z -> R), if decide (b ≤ a) then sum f a b = 0%R else sum f a b = Rplus (sum f a (b - 1%Z)) (f (b - 1%Z)).
Axiom abs_fun : (Z -> R) -> Z -> R.
Axiom abs_fun'def : forall  (f : Z -> R) (i : Z), abs_fun f i = Rabs (f i).
Theorem sum_strictly_pos'vc (a : Z) (b : Z) (f : Z -> R) (fact0 : a < b) (fact1 : ∀(i : Z), a ≤ i ∧ i < b -> Rlt 0%R (f i)) : Rlt 0%R (sum f a b).
Proof.
Admitted.
