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
Theorem test1'vc : 0%Z ≤ 3%Z ∧ (∀(m1 : matrix Z), rows m1 = 3%Z ∧ columns m1 = 3%Z ∧ (∀(i : Z) (j : Z), (0%Z ≤ i ∧ i < 3%Z) ∧ 0%Z ≤ j ∧ j < 3%Z -> elts m1 i j = 2%Z) -> valid_index m1 0%Z 0%Z).
Admitted.
