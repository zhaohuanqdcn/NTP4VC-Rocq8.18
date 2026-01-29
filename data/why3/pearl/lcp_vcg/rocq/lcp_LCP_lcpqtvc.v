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
Definition eqseq (a : list Z) (x : Z) (y : Z) (len : Z) := 0%Z ≤ len ∧ x + len ≤ Z.of_nat (length a) ∧ y + len ≤ Z.of_nat (length a) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len -> nth (Z.to_nat (x + i)) a inhabitant = nth (Z.to_nat (y + i)) a inhabitant).
Theorem lcp'vc (x : Z) (a : list Z) (y : Z) (fact0 : 0%Z ≤ x) (fact1 : x < Z.of_nat (length a)) (fact2 : 0%Z ≤ y) (fact3 : y < Z.of_nat (length a)) : eqseq a x y 0%Z ∧ (∀(l : Z), eqseq a x y l -> (let o1 : Z := Z.of_nat (length a) in let o2 : Z := x + l in (o2 < o1 -> y + l < Z.of_nat (length a) -> (let o3 : Z := y + l in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)) ∧ (let o4 : Z := x + l in 0%Z ≤ o4 ∧ o4 < Z.of_nat (length a)))) ∧ (∀(o3 : bool), (if decide (o2 < o1) then if decide (y + l < Z.of_nat (length a)) then o3 = (if decide (nth (Z.to_nat (x + l)) a inhabitant = nth (Z.to_nat (y + l)) a inhabitant) then true else false) else o3 = false else o3 = false) -> (if decide (o3 = true) then (0%Z ≤ Z.of_nat (length a) - l ∧ Z.of_nat (length a) - (l + 1%Z) < Z.of_nat (length a) - l) ∧ eqseq a x y (l + 1%Z) else eqseq a x y l ∧ (∀(len : Z), l < len -> ¬ eqseq a x y len))))).
Proof.
Admitted.
