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
Open Scope Z_scope.
Axiom o1 : Z -> Z.
Axiom o2 : Z -> Z.
Axiom fc : Z -> Z.
Axiom o'def : forall  (x'x : Z), o1 x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else 3%Z).
Axiom o'def1 : forall  (x'x : Z), o2 x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else 3%Z).
Axiom fc'def : forall  (x'x : Z), fc x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else 3%Z).
Theorem array_ok1'vc : 0%Z ≤ 4%Z ∧ (∀(result : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) result inhabitant = o2 i) ∧ Z.of_nat (length result) = 4%Z -> result = create_list 4%nat (fc ∘ Z.of_nat)).
Admitted.
