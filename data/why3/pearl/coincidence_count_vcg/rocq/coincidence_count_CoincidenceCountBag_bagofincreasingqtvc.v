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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Definition increasing (a : list Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant.
Axiom bagofsub : forall {α : Type} `{Inhabited α} `{Countable α}, list α -> Z -> Z -> gmultiset α.
Axiom bagofsub'def : forall  {α : Type} `{Inhabited α} `{Countable α} (lo : Z) (hi : Z) (a : list α) (fact0 : 0%Z ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Z.of_nat (length a)), if decide (hi ≤ lo) then bagofsub a lo hi = (∅ : gmultiset α) else bagofsub a lo hi = insert_mset (nth (Z.to_nat lo) a inhabitant) (bagofsub a (lo + 1%Z) hi).
Definition bagof {α : Type} `{Inhabited α} `{Countable α} (a : list α) : gmultiset α := bagofsub a 0%Z (Z.of_nat (length a)).
Definition drop {α : Type} `{Inhabited α} `{Countable α} (a : list α) (i : Z) : gmultiset α := bagofsub a i (Z.of_nat (length a)).
Theorem bagofincreasing'vc (a : list Z) (i : Z) (x : Z) (fact0 : increasing a) (fact1 : 0%Z ≤ i) (fact2 : i < Z.of_nat (length a)) (fact3 : x < nth (Z.to_nat i) a inhabitant) : ¬ x ∈ drop a i.
Admitted.
