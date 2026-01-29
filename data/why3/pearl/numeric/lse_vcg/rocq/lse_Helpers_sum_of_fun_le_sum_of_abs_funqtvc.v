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
Require Import Why3.real.Sum.
Require Import Why3.ieee_float.RoundingMode.
Require Import Why3.ufloat.USingle.
Require Import Why3.ufloat.HelperLemmas.
Require Import Why3.ufloat.USingleLemmas.
Open Scope Z_scope.
Axiom abs_fun : (Z -> R) -> Z -> R.
Axiom abs_fun'def : forall  (f : Z -> R) (i : Z), abs_fun f i = Rabs (f i).
Axiom abs_real_fun : (Z -> usingle) -> Z -> R.
Axiom abs_real_fun'def : forall  (f : Z -> usingle) (i : Z), abs_real_fun f i = abs_fun (real_fun f) i.
Theorem sum_of_fun_le_sum_of_abs_fun'vc (b : Z) (a : Z) (f : Z -> usingle) (fact0 : 0%Z ≤ b - a) : Rle (Rabs (sum (real_fun f) a b)) (sum (abs_real_fun f) a b).
Proof.
Admitted.
