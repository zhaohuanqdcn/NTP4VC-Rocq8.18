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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom addf : (Z -> Z) -> (Z -> Z) -> Z -> Z.
Axiom addf'def : forall  (f : Z -> Z) (g : Z -> Z) (x : Z), addf f g x = f x + g x.
Axiom smulf : (Z -> Z) -> Z -> Z -> Z.
Axiom smulf'def : forall  (f : Z -> Z) (l : Z) (x : Z), smulf f l x = l * f x.
Theorem sum_mult'vc (f : Z -> Z) (l : Z) (a : Z) (b : Z) : sum (smulf f l) a b = l * sum f a b.
Proof.
Admitted.
