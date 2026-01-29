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
Axiom o1 : Z -> Z -> Z.
Axiom o2 : Z -> Z -> Z.
Axiom fc : Z -> Z -> Z.
Axiom o'def : forall  (default : Z) (x'x : Z), o1 default x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else default).
Axiom o'def1 : forall  (default : Z) (x'x : Z), o2 default x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else default).
Axiom fc'def : forall  (default : Z) (x'x : Z), fc default x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else default).
Theorem array_ok3'vc (default : Z) : 0%Z ≤ 4%Z ∧ (∀(result : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) result inhabitant = o2 default i) ∧ Z.of_nat (length result) = 4%Z -> result = create_list 4%nat (fc default ∘ Z.of_nat)).
Proof.
Admitted.
