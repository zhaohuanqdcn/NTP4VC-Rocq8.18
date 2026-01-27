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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Definition sqr (x : bv 32%N) : bv 32%N := bv_mul x x.
Definition is_pow2 (x : bv 32%N) (n : bv 32%N) := bv_and x (bv_sub (bv_shiftl (1%bv : bv 32%N) n) (1%bv : bv 32%N)) = (0%bv : bv 32%N).
Theorem sqr_add2'vc (x : bv 32%N) (y : bv 32%N) : sqr (bv_add x y) = bv_add (sqr x) (bv_mul y (bv_add (bv_mul (2%bv : bv 32%N) x) y)).
Admitted.
