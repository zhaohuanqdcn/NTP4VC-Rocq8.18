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
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Inductive path : matrix bool -> Z -> Z -> Z -> Prop :=
 | Path_empty (m : matrix bool) (i : Z) (j : Z) (k : Z) : elts m i j = true -> path m i j k
 | Path_cons (x : Z) (k : Z) (m : matrix bool) (i : Z) (j : Z) : 0%Z ≤ x -> x < k -> path m i x k -> path m x j k -> path m i j k.
Theorem weakening'vc (k1 : Z) (k2 : Z) (m : matrix bool) (i : Z) (j : Z) (fact0 : 0%Z ≤ k1) (fact1 : k1 ≤ k2) (fact2 : path m i j k1) : path m i j k2.
Proof.
Admitted.
