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
Theorem dll'vc : 0%Z ≤ 0%Z ∧ (∀(o1 : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o1 inhabitant = 0%Z) ∧ Z.of_nat (length o1) = 0%Z -> 0%Z ≤ 0%Z ∧ (∀(o2 : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> nth (Z.to_nat i) o2 inhabitant = 0%Z) ∧ Z.of_nat (length o2) = 0%Z -> length o2 = length o1 ∧ Z.of_nat (length o1) = 0%Z)).
Proof.
Admitted.
