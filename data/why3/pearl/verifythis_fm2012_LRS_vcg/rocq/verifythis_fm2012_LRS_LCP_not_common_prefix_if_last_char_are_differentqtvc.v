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
Open Scope Z_scope.
Definition is_common_prefix (a : list Z) (x : Z) (y : Z) (l : Z) := 0%Z ≤ l ∧ x + l ≤ Z.of_nat (length a) ∧ y + l ≤ Z.of_nat (length a) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l -> nth (Z.to_nat (x + i)) a inhabitant = nth (Z.to_nat (y + i)) a inhabitant).
Theorem not_common_prefix_if_last_char_are_different'vc (l : Z) (x : Z) (a : list Z) (y : Z) (fact0 : 0%Z ≤ l) (fact1 : x + l < Z.of_nat (length a)) (fact2 : y + l < Z.of_nat (length a)) (fact3 : ¬ nth (Z.to_nat (x + l)) a inhabitant = nth (Z.to_nat (y + l)) a inhabitant) : ¬ is_common_prefix a x y (l + 1%Z).
Proof.
Admitted.
