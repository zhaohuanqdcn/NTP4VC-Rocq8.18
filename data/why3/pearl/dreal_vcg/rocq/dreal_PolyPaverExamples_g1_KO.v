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
Theorem g1_KO (a : R) (b : R) (fact0 : Rle (Ropp 10%R) a) (fact1 : Rle a 10%R) (fact2 : Rle (Ropp 10%R) b) (fact3 : Rle b 10%R) (fact4 : Rlt (Rplus a (Rdiv 1%R 10)) b) : Rlt (Rmult (Rminus b a) (exp (Rdiv (Rplus a b) 2%R))) (Rminus (exp a) (exp b)).
Proof.
Admitted.
