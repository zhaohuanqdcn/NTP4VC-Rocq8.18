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
Axiom sum : (Z -> Z) -> Z -> Z -> Z.
Axiom sum'def : forall  (b : Z) (a : Z) (f : Z -> Z), if decide (b ≤ a) then sum f a b = 0%Z else sum f a b = sum f a (b - 1%Z) + f (b - 1%Z).
Axiom sum_left : forall  (a : Z) (b : Z) (f : Z -> Z) (fact0 : a < b), sum f a b = f a + sum f (a + 1%Z) b.
Axiom sum_ext : forall  (a : Z) (b : Z) (f : Z -> Z) (g : Z -> Z) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> f i = g i), sum f a b = sum g a b.
Axiom sum_le : forall  (a : Z) (b : Z) (f : Z -> Z) (g : Z -> Z) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> f i ≤ g i), sum f a b ≤ sum g a b.
Axiom sum_zero : forall  (a : Z) (b : Z) (f : Z -> Z) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> f i = 0%Z), sum f a b = 0%Z.
Axiom sum_nonneg : forall  (a : Z) (b : Z) (f : Z -> Z) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> 0%Z ≤ f i), 0%Z ≤ sum f a b.
Axiom sum_decomp : forall  (a : Z) (b : Z) (c : Z) (f : Z -> Z) (fact0 : a ≤ b) (fact1 : b ≤ c), sum f a c = sum f a b + sum f b c.
Axiom shift_left : forall  (b : Z) (a : Z) (d : Z) (c : Z) (f : Z -> Z) (g : Z -> Z) (fact0 : b - a = d - c) (fact1 : ∀(i : Z), a ≤ i ∧ i < b -> f i = g (c + i - a)), sum f a b = sum g c d.
