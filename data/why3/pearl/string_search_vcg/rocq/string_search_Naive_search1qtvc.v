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
Require Import string_search_vcg.string_search.Spec.
Require Import string_search_vcg.string_search.Occurs.
Open Scope Z_scope.
Theorem search1'vc (pat : string) (text : string) (m : bv 63%N) (n : bv 63%N) (fact0 : Z.of_nat (String.length pat) ≤ Z.of_nat (String.length text)) (fact1 : bv_signed m = Z.of_nat (String.length pat)) (fact2 : 0%Z ≤ Z.of_nat (String.length pat)) (fact3 : bv_signed n = Z.of_nat (String.length text)) (fact4 : 0%Z ≤ Z.of_nat (String.length text)) : int'63_in_bounds (bv_signed n - bv_signed m) ∧ (∀(o1 : bv 63%N), bv_signed o1 = bv_signed n - bv_signed m -> (0%Z ≤ bv_signed o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ substring (Z.to_nat j) (Z.to_nat (bv_signed m)) text = pat) ∧ (∀(i : bv 63%N), let i1 : Z := bv_signed i in (0%Z ≤ i1 ∧ i1 ≤ bv_signed o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i1 -> ¬ substring (Z.to_nat j) (Z.to_nat (bv_signed m)) text = pat) -> (0%Z ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (String.length text) - Z.of_nat (String.length pat)) ∧ (if decide (matches1 pat text (bv_signed i)) then (- 1%Z ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (String.length text) - Z.of_nat (String.length pat)) ∧ (if decide (bv_signed i = - 1%Z) then ∀(j : Z), ¬ matches1 pat text j else matches1 pat text (bv_signed i)) else ∀(j : Z), 0%Z ≤ j ∧ j < i1 + 1%Z -> ¬ substring (Z.to_nat j) (Z.to_nat (bv_signed m)) text = pat)) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < bv_signed o1 + 1%Z -> ¬ substring (Z.to_nat j) (Z.to_nat (bv_signed m)) text = pat) -> (- 1%Z ≤ - 1%Z ∧ - 1%Z ≤ Z.of_nat (String.length text) - Z.of_nat (String.length pat)) ∧ (∀(j : Z), ¬ matches1 pat text j))) ∧ (bv_signed o1 + 1%Z < 0%Z -> (- 1%Z ≤ - 1%Z ∧ - 1%Z ≤ Z.of_nat (String.length text) - Z.of_nat (String.length pat)) ∧ (∀(j : Z), ¬ matches1 pat text j))).
Admitted.
