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
Axiom o1 : Z -> Z -> Z.
Axiom fc : Z -> Z -> Z.
Axiom o'def : forall  (default : Z) (x'x : Z), o1 default x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else default).
Axiom fc'def : forall  (default : Z) (x'x : Z), fc default x'x = (if decide (x'x = 0%Z) then 0%Z else if decide (x'x = 1%Z) then 1%Z else if decide (x'x = 2%Z) then 2%Z else if decide (x'x = 3%Z) then 3%Z else default).
Theorem seq_ok3'vc (default : Z) : let o2 : Z -> Z := o1 default in 0%Z ≤ 4%Z ∧ (let result : list Z := create_list 4%nat (o2 ∘ Z.of_nat) in Z.of_nat (length result) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> nth (Z.to_nat i) result inhabitant = o2 i) -> result = create_list 4%nat (fc default ∘ Z.of_nat)).
Admitted.
