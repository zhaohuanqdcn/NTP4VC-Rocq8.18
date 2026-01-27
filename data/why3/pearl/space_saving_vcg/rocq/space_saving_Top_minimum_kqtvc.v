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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom dummy : elt.
Axiom minimum : list Z -> Z.
Axiom minimum'spec'0 : forall  (a : list Z) (fact0 : 0%Z < Z.of_nat (length a)), 0%Z ≤ minimum a ∧ minimum a < Z.of_nat (length a).
Axiom minimum'spec : forall  (a : list Z) (i : Z) (fact0 : 0%Z < Z.of_nat (length a)) (fact1 : 0%Z ≤ i) (fact2 : i < Z.of_nat (length a)), nth (Z.to_nat (minimum a)) a inhabitant ≤ nth (Z.to_nat i) a inhabitant.
Definition occurs (v : elt) (a : list elt) := ∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ v = nth (Z.to_nat i) a inhabitant.
Theorem minimum_k'vc (c : list Z) (fact0 : 2%Z ≤ Z.of_nat (length c)) (fact1 : 0%Z ≤ list_sum (drop 0%nat (take (length c - 0%nat) c))) : Z.of_nat (length c) * nth (Z.to_nat (minimum c)) c inhabitant ≤ list_sum (drop 0%nat (take (length c - 0%nat) c)).
Admitted.
