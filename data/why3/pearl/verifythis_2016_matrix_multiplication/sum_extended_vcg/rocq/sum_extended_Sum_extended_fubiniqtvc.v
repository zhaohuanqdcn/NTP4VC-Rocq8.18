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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom addf : (Z -> Z) -> (Z -> Z) -> Z -> Z.
Axiom addf'def : forall  (f : Z -> Z) (g : Z -> Z) (x : Z), addf f g x = f x + g x.
Axiom smulf : (Z -> Z) -> Z -> Z -> Z.
Axiom smulf'def : forall  (f : Z -> Z) (l : Z) (x : Z), smulf f l x = l * f x.
Axiom sumf : (Z -> Z -> Z) -> Z -> Z -> Z -> Z.
Axiom sumf'def : forall  (f : Z -> Z -> Z) (a : Z) (b : Z) (x : Z), sumf f a b x = sum (f x) a b.
Theorem fubini'vc (a : Z) (b : Z) (c : Z) (d : Z) (f1 : Z -> Z -> Z) (f2 : Z -> Z -> Z) (fact0 : ∀(x : Z) (y : Z), (a ≤ x ∧ x < b) ∧ c ≤ y ∧ y < d -> f1 x y = f2 y x) : sum (sumf f1 c d) a b = sum (sumf f2 a b) c d.
Admitted.
