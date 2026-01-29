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
Require Import Why3.map.MapEq.
Open Scope Z_scope.
Axiom to_list_from : Z -> list Z -> list Z.
Axiom to_list_from'def : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)), if decide (i = Z.of_nat (length a)) then to_list_from i a = ([] : list Z) else to_list_from i a = cons (nth (Z.to_nat i) a inhabitant) (to_list_from (i + 1%Z) a).
Axiom to_list_from'spec'0 : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)), Z.of_nat (length (to_list_from i a)) = Z.of_nat (length a) - i.
Axiom to_list_from'spec : forall  (i : Z) (a : list Z) (k : Z) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)) (fact2 : 0%Z ≤ k) (fact3 : k < Z.of_nat (length a) - i), nth_error_i (to_list_from i a) k = Some (nth (Z.to_nat (k + i)) a inhabitant).
Theorem to_list_array_eq'vc (a1 : list Z) (a2 : list Z) (fact0 : a1 = a2) : (∀(a11 : list Z) (a21 : list Z) (i : Z), (0%Z ≤ i ∧ i ≤ Z.of_nat (length a11)) ∧ a11 = a21 -> to_list_from i a11 = to_list_from i a21) ∧ to_list_from 0%Z a1 = to_list_from 0%Z a2.
Proof.
Admitted.
