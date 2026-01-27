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
Theorem buffer'vc {α : Type} `{Inhabited α} (o2 : α) : 0%Z ≤ 1%Z ∧ (∀(o1 : list α), (∀(i : Z), 0%Z ≤ i ∧ i < 1%Z -> nth (Z.to_nat i) o1 inhabitant = o2) ∧ Z.of_nat (length o1) = 1%Z -> (let sequence : list α := ([] : list α) in let size : Z := Z.of_nat (length o1) in (0%Z ≤ 0%Z ∧ 0%Z < size) ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ size) ∧ 0%Z = Z.of_nat (length sequence) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> (0%Z + i < size -> nth (Z.to_nat i) sequence inhabitant = nth (Z.to_nat (0%Z + i)) o1 inhabitant) ∧ (0%Z ≤ 0%Z + i - size -> nth (Z.to_nat i) sequence inhabitant = nth (Z.to_nat (0%Z + i - size)) o1 inhabitant)))).
Admitted.
