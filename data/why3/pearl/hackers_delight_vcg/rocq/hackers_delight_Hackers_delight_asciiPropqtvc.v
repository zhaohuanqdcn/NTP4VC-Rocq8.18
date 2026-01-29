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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.int.NumOf.
Require Import hackers_delight_vcg.hackers_delight.Utils.
Open Scope Z_scope.
Definition validAscii (b : bv 32%N) := Z.testbit (bv_unsigned (count b)) (bv_unsigned (0%bv : bv 32%N)) = false.
Theorem asciiProp'vc (a : bv 32%N) (b : bv 32%N) : (validAscii a ∧ ¬ validAscii b ∨ validAscii b ∧ ¬ validAscii a) = (Z.testbit (bv_unsigned (hammingD a b)) (bv_unsigned (0%bv : bv 32%N)) = true).
Proof.
Admitted.
