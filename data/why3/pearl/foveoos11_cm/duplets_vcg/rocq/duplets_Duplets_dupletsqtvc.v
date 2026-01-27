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
Definition is_duplet (a : list Z) (i : Z) (j : Z) := (0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant.
Definition eq_opt (x : Z) (o1 : option Z) := match o1 with | None => False | Some v => v = x end.
Theorem duplets'vc (a : list Z) (fact0 : 4%Z ≤ Z.of_nat (length a)) (fact1 : ∃(i : Z) (j : Z) (k : Z) (l : Z), is_duplet a i j ∧ is_duplet a k l ∧ ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat k) a inhabitant) : let o1 : option Z := None in (2%Z ≤ Z.of_nat (length a) ∧ (∃(i : Z) (j : Z), is_duplet a i j ∧ ¬ eq_opt (nth (Z.to_nat i) a inhabitant) o1)) ∧ (∀(i : Z) (j : Z), is_duplet a i j ∧ ¬ eq_opt (nth (Z.to_nat i) a inhabitant) o1 -> ((0%Z ≤ j ∧ j < Z.of_nat (length a)) ∧ 2%Z ≤ Z.of_nat (length a) ∧ (∃(i1 : Z) (j1 : Z), is_duplet a i1 j1 ∧ ¬ eq_opt (nth (Z.to_nat i1) a inhabitant) (Some (nth (Z.to_nat j) a inhabitant)))) ∧ (∀(result : Z) (result1 : Z), is_duplet a result result1 ∧ ¬ eq_opt (nth (Z.to_nat result) a inhabitant) (Some (nth (Z.to_nat j) a inhabitant)) -> is_duplet a i j ∧ is_duplet a result result1 ∧ ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat result) a inhabitant)).
Admitted.
