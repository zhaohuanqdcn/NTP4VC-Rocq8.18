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
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom balancing : nat.
Axiom balancing'def : 0%Z < Z.of_nat balancing.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom le : t -> t -> Prop.
Axiom Refl : forall  (x : t), le x x.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom eq : t -> t -> Prop.
Axiom eq_def : forall  (x : t) (y : t), eq x y = (le x y ∧ le y x).
Axiom lt : t -> t -> Prop.
Axiom lt_def : forall  (x : t) (y : t), lt x y = (le x y ∧ ¬ le y x).
Axiom Total : forall  (x : t) (y : t), le x y ∨ le y x.
Axiom t1 : Type -> Type.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Theorem Trans1 (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z) : le x z.
Proof.
Admitted.
