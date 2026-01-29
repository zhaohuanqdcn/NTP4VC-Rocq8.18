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
Require Import edit_distance_vcg.edit_distance.MyWord.
Open Scope Z_scope.
Axiom suffix : list char -> Z -> list char.
Axiom suffix_nil : forall  (a : list char), suffix a (Z.of_nat (length a)) = ([] : list char).
Axiom suffix_cons : forall  (i : Z) (a : list char) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length a)), suffix a i = cons (nth (Z.to_nat i) a inhabitant) (suffix a (i + 1%Z)).
Theorem suffix_length'vc (i : Z) (a : list char) (fact0 : 0%Z ≤ i) (fact1 : i ≤ Z.of_nat (length a)) : Z.of_nat (length (suffix a i)) = Z.of_nat (length a) - i.
Proof.
Admitted.
