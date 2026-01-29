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
Require Import string_search_vcg.string_search.Spec.
Open Scope Z_scope.
Theorem occurs'vc (p : bv 63%N) (text : string) (pat : string) (n : bv 63%N) (m : bv 63%N) (fact0 : 0%Z ≤ bv_signed p) (fact1 : bv_signed p ≤ Z.of_nat (String.length text) - Z.of_nat (String.length pat)) (fact2 : bv_signed n = Z.of_nat (String.length text)) (fact3 : 0%Z ≤ Z.of_nat (String.length text)) (fact4 : bv_signed m = Z.of_nat (String.length pat)) (fact5 : 0%Z ≤ Z.of_nat (String.length pat)) : int'63_in_bounds (bv_signed m - 1%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed m - 1%Z -> (0%Z ≤ bv_signed o1 + 1%Z -> substring (Z.to_nat (bv_signed p)) 0%nat text = substring 0%nat 0%nat pat ∧ (∀(i : bv 63%N), let i1 : Z := bv_signed i in (0%Z ≤ i1 ∧ i1 ≤ bv_signed o1) ∧ substring (Z.to_nat (bv_signed p)) (Z.to_nat i1) text = substring 0%nat (Z.to_nat i1) pat -> (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (String.length pat)) ∧ int'63_in_bounds (bv_signed p + bv_signed i) ∧ (∀(o2 : bv 63%N), bv_signed o2 = bv_signed p + bv_signed i -> (0%Z ≤ bv_signed o2 ∧ bv_signed o2 < Z.of_nat (String.length text)) ∧ (if decide (¬ get_str_i text (bv_signed o2) = get_str_i pat (bv_signed i)) then ¬ matches1 pat text (bv_signed p) else substring (Z.to_nat (bv_signed p)) (Z.to_nat (i1 + 1%Z)) text = substring 0%nat (Z.to_nat (i1 + 1%Z)) pat))) ∧ (substring (Z.to_nat (bv_signed p)) (Z.to_nat (bv_signed o1 + 1%Z)) text = substring 0%nat (Z.to_nat (bv_signed o1 + 1%Z)) pat -> matches1 pat text (bv_signed p))) ∧ (bv_signed o1 + 1%Z < 0%Z -> matches1 pat text (bv_signed p))).
Proof.
Admitted.
