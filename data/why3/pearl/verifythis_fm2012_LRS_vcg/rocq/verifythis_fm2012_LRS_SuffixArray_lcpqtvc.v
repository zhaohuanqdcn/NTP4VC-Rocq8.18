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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.map.MapInjection.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixSort.
Open Scope Z_scope.
Definition permutation (m : Z -> Z) (u : Z) := MapInjection.range m u ∧ injective m u.
Axiom suffixArray : Type.
Axiom suffixArray_inhabited : Inhabited suffixArray.
Global Existing Instance suffixArray_inhabited.
Axiom suffixArray_countable : Countable suffixArray.
Global Existing Instance suffixArray_countable.
Axiom values : suffixArray -> list Z.
Axiom suffixes : suffixArray -> list Z.
Axiom suffixArray'invariant : forall  (self : suffixArray), length (values self) = length (suffixes self) ∧ permutation (nth_i (suffixes self)) (Z.of_nat (length (suffixes self))) ∧ sorted (values self) (suffixes self).
Definition suffixArray'eq (a : suffixArray) (b : suffixArray) := values a = values b ∧ suffixes a = suffixes b.
Axiom suffixArray'inj : forall  (a : suffixArray) (b : suffixArray) (fact0 : suffixArray'eq a b), a = b.
Theorem lcp'vc (i : Z) (s : suffixArray) (fact0 : 0%Z < i) (fact1 : i < Z.of_nat (length (values s))) : let o1 : Z := i - 1%Z in let o2 : list Z := suffixes s in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o2)) ∧ (let o3 : Z := nth (Z.to_nat o1) o2 inhabitant in let o4 : list Z := suffixes s in (0%Z ≤ i ∧ i < Z.of_nat (length o4)) ∧ (let o5 : Z := nth (Z.to_nat i) o4 inhabitant in let o6 : list Z := values s in ((0%Z ≤ o5 ∧ o5 ≤ Z.of_nat (length o6)) ∧ 0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length o6)) ∧ (∀(result : Z), is_longest_common_prefix o6 o5 o3 result -> is_longest_common_prefix (values s) (nth (Z.to_nat (i - 1%Z)) (suffixes s) inhabitant) (nth (Z.to_nat i) (suffixes s) inhabitant) result))).
Proof.
Admitted.
