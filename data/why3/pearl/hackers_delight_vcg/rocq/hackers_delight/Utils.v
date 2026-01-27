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
Open Scope Z_scope.
Definition max (x : bv 32%N) (y : bv 32%N) : bv 32%N := if decide (bv_ult x y) then y else x.
Definition min (x : bv 32%N) (y : bv 32%N) : bv 32%N := if decide (bv_ult x y) then x else y.
Definition count (bv : definitions.bv 32%N) : definitions.bv 32%N := let x : definitions.bv 32%N := bv_sub bv (bv_and (bv_shiftr bv (1%bv : definitions.bv 32%N)) (1431655765%bv : definitions.bv 32%N)) in let x1 : definitions.bv 32%N := bv_add (bv_and x (858993459%bv : definitions.bv 32%N)) (bv_and (bv_shiftr x (2%bv : definitions.bv 32%N)) (858993459%bv : definitions.bv 32%N)) in let x2 : definitions.bv 32%N := bv_and (bv_add x1 (bv_shiftr x1 (4%bv : definitions.bv 32%N))) (252645135%bv : definitions.bv 32%N) in let x3 : definitions.bv 32%N := bv_add x2 (bv_shiftr x2 (8%bv : definitions.bv 32%N)) in bv_and (bv_add x3 (bv_shiftr x3 (16%bv : definitions.bv 32%N))) (63%bv : definitions.bv 32%N).
Definition hammingD (a : bv 32%N) (b : bv 32%N) : bv 32%N := count (bv_xor a b).
