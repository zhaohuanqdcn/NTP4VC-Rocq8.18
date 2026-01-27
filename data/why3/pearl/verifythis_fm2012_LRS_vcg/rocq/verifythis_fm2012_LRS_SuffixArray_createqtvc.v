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
Theorem create'vc (a : list Z) : let n : Z := Z.of_nat (length a) in 0%Z ≤ n ∧ (∀(suf : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < n -> nth (Z.to_nat i) suf inhabitant = 0%Z) ∧ Z.of_nat (length suf) = n -> (let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) suf inhabitant = j) ∧ (∀(suf1 : list Z), length suf1 = length suf -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) suf1 inhabitant = j) -> (0%Z ≤ i ∧ i < Z.of_nat (length suf1)) ∧ (length (set_list suf1 (Z.to_nat i) i) = length suf1 -> nth_i (set_list suf1 (Z.to_nat i) i) = fun_updt (nth_i suf1) i i -> (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> nth (Z.to_nat j) (set_list suf1 (Z.to_nat i) i) inhabitant = j))) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> nth (Z.to_nat j) suf1 inhabitant = j) -> (length suf1 = length a ∧ SuffixSort.range suf1) ∧ (∀(suf2 : list Z), length suf2 = length suf1 -> sorted a suf2 ∧ suf1 ≡ₚ suf2 -> (length a = length suf2 ∧ permutation (nth_i suf2) (Z.of_nat (length suf2)) ∧ sorted a suf2) ∧ (∀(result : suffixArray), values result = a ∧ suffixes result = suf2 -> values result = a))))) ∧ (o1 + 1%Z < 0%Z -> (length suf = length a ∧ SuffixSort.range suf) ∧ (∀(suf1 : list Z), length suf1 = length suf -> sorted a suf1 ∧ suf ≡ₚ suf1 -> (length a = length suf1 ∧ permutation (nth_i suf1) (Z.of_nat (length suf1)) ∧ sorted a suf1) ∧ (∀(result : suffixArray), values result = a ∧ suffixes result = suf1 -> values result = a))))).
Admitted.
