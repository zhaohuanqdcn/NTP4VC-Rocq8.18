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
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom rel : t -> t -> Prop.
Axiom Refl : forall  (x : t), rel x x.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z), rel x z.
Axiom Antisymm : forall  (x : t) (y : t) (fact0 : rel x y) (fact1 : rel y x), x = y.
Axiom a : gset t.
Axiom e : t.
Axiom minimality : e ∈ a ∧ (∀(x : t), x ∈ a -> rel e x).
Axiom f : t -> t.
Axiom range : forall  (x : t) (fact0 : x ∈ a), f x ∈ a.
Axiom monotone : forall  (x : t) (y : t) (fact0 : x ∈ a) (fact1 : y ∈ a) (fact2 : rel x y), rel (f x) (f y).
Definition fixpoint (x : t) := x ∈ a ∧ f x = x.
Theorem least_fix_point'vc : ∃(mu : t), fixpoint mu ∧ (∀(x : t), fixpoint x -> rel mu x).
Admitted.
