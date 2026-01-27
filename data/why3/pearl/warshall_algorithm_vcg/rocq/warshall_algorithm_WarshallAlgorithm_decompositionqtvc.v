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
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Inductive path : matrix bool -> Z -> Z -> Z -> Prop :=
 | Path_empty (m : matrix bool) (i : Z) (j : Z) (k : Z) : elts m i j = true -> path m i j k
 | Path_cons (x : Z) (k : Z) (m : matrix bool) (i : Z) (j : Z) : 0%Z ≤ x -> x < k -> path m i x k -> path m x j k -> path m i j k.
Theorem decomposition'vc (k : Z) (m : matrix bool) (i : Z) (j : Z) (fact0 : 0%Z ≤ k) (fact1 : path m i j (k + 1%Z)) : path m i j k ∨ path m i k k ∧ path m k j k.
Admitted.
