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
Open Scope Z_scope.
Axiom n : Z.
Axiom n'def : 0%Z < n.
Axiom f : Z -> Z.
Axiom f'spec : forall  (k : Z) (fact0 : 0%Z < k) (fact1 : k < n), 0%Z ≤ f k ∧ f k < k.
Inductive path : Z -> Z -> Prop :=
 | path0 : path 0%Z 0%Z
 | paths (i : Z) (d : Z) (j : Z) : 0%Z ≤ i -> i < n -> path d j -> f i ≤ j -> j < i -> path (d + 1%Z) i.
Definition distance (d : Z) (i : Z) := path d i ∧ (∀(d' : Z), path d' i -> d ≤ d').
