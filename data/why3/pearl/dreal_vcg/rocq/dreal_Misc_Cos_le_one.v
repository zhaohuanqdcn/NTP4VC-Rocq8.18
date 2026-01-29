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
Axiom exp_limit_fun : R -> unit.
Axiom exp_limit_fun'def : forall  (x : R) (fact0 : Rle (Rabs x) 25%R), exp_limit_fun x = ().
Axiom exp_limit_fun'spec : forall  (x : R) (fact0 : Rle (Rabs x) 25%R), Rle (exp x) 72004899338%R.
Theorem Cos_le_one (x : R) : Rle (Rabs (cos x)) 1%R.
Proof.
Admitted.
