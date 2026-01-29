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
Open Scope Z_scope.
Definition range (f : Z -> Z) (n : Z) (m : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ f i ∧ f i < m.
Definition injective (f : Z -> Z) (n : Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < n -> ¬ f i = f j.
Axiom shift : (Z -> Z) -> Z -> Z -> Z.
Axiom shift'def : forall  (f : Z -> Z) (i : Z) (k : Z), shift f i k = (if decide (k < i) then f k else f (k + 1%Z)).
Theorem pigeon_hole'vc (f : Z -> Z) (n : Z) (m : Z) (fact0 : range f n m) (fact1 : m < n) (fact2 : 0%Z ≤ m) : ¬ injective f n.
Proof.
Admitted.
