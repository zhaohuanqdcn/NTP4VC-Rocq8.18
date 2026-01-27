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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.int.NumOf.
Require Import hackers_delight_vcg.hackers_delight.Utils.
Open Scope Z_scope.
Theorem countStep'vc (b : bv 32%N) : (¬ Z.testbit (bv_unsigned b) (bv_unsigned (0%bv : bv 32%N)) = true) = (count (bv_shiftr b (1%bv : bv 32%N)) = count b) ∧ (Z.testbit (bv_unsigned b) (bv_unsigned (0%bv : bv 32%N)) = true) = (count (bv_shiftr b (1%bv : bv 32%N)) = bv_sub (count b) (1%bv : bv 32%N)).
Admitted.
