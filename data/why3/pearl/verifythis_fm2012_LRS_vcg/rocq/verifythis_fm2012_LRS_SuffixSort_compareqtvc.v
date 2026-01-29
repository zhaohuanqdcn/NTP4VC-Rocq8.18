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
Require Import Why3.why3.Ref.Ref.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Open Scope Z_scope.
Definition lt (a : list Z) (x : Z) (y : Z) := let n : Z := Z.of_nat (length a) in (0%Z ≤ x ∧ x ≤ n) ∧ (0%Z ≤ y ∧ y ≤ n) ∧ (∃(l : Z), is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ nth (Z.to_nat (x + l)) a inhabitant < nth (Z.to_nat (y + l)) a inhabitant)).
Theorem compare'vc (x : Z) (a : list Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : x ≤ Z.of_nat (length a)) (fact2 : 0%Z ≤ y) (fact3 : y ≤ Z.of_nat (length a)) : (¬ x = y -> (let n : Z := Z.of_nat (length a) in ((0%Z ≤ x ∧ x ≤ Z.of_nat (length a)) ∧ 0%Z ≤ y ∧ y ≤ Z.of_nat (length a)) ∧ (∀(l : Z), is_longest_common_prefix a x y l -> ¬ x + l = n -> ¬ y + l = n -> (let o1 : Z := y + l in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length a)) ∧ (let o2 : Z := x + l in (0%Z ≤ o2 ∧ o2 < Z.of_nat (length a)) ∧ (¬ nth (Z.to_nat o2) a inhabitant < nth (Z.to_nat o1) a inhabitant -> (let o3 : Z := y + l in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)) ∧ (let o4 : Z := x + l in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length a)) ∧ nth (Z.to_nat o3) a inhabitant < nth (Z.to_nat o4) a inhabitant)))))))) ∧ (∀(result : Z), (if decide (x = y) then result = 0%Z else let n : Z := Z.of_nat (length a) in ∃(l : Z), is_longest_common_prefix a x y l ∧ (if decide (x + l = n) then result = - 1%Z else if decide (y + l = n) then result = 1%Z else if decide (nth (Z.to_nat (x + l)) a inhabitant < nth (Z.to_nat (y + l)) a inhabitant) then result = - 1%Z else nth (Z.to_nat (y + l)) a inhabitant < nth (Z.to_nat (x + l)) a inhabitant ∧ result = 1%Z)) -> (result = 0%Z -> x = y) ∧ (result < 0%Z -> lt a x y) ∧ (0%Z < result -> lt a y x)).
Proof.
Admitted.
