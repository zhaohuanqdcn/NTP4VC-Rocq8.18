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
Open Scope Z_scope.
Definition decrease1 (a : list Z) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) - 1%Z -> nth (Z.to_nat i) a inhabitant - 1%Z ≤ nth (Z.to_nat (i + 1%Z)) a inhabitant.
Theorem decrease1_induction'vc (a : list Z) (i : Z) (j : Z) (fact0 : decrease1 a) (fact1 : 0%Z ≤ i) (fact2 : i ≤ j) (fact3 : j < Z.of_nat (length a)) : nth (Z.to_nat i) a inhabitant + i - j ≤ nth (Z.to_nat j) a inhabitant.
Proof.
Admitted.
