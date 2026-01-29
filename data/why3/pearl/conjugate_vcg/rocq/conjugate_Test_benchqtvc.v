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
Require Import conjugate_vcg.conjugate.Conjugate.
Open Scope Z_scope.
Theorem bench'vc (a : list Z) (fact0 : 4%Z ≤ Z.of_nat (length a)) : 0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a) ∧ (nth 0%nat a inhabitant = 4%Z -> (0%Z ≤ 1%Z ∧ 1%Z < Z.of_nat (length a)) ∧ (nth 1%nat a inhabitant = 3%Z -> (0%Z ≤ 2%Z ∧ 2%Z < Z.of_nat (length a)) ∧ (nth 2%nat a inhabitant = 1%Z -> 0%Z ≤ 3%Z ∧ 3%Z < Z.of_nat (length a)))).
Proof.
Admitted.
