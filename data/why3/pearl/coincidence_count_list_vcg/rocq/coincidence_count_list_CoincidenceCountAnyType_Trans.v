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
Axiom eq : t -> t -> Prop.
Axiom eq'spec : forall  (x : t) (y : t), eq x y = (x = y).
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset t.
Axiom mk : gset t -> set.
Axiom mk'spec : forall  (s : gset t), to_fset (mk s) = s.
Axiom choose1 : set -> t.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Axiom rel : t -> t -> Prop.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z), rel x z.
Axiom Asymm : forall  (x : t) (y : t) (fact0 : rel x y), ¬ rel y x.
Axiom Trichotomy : forall  (x : t) (y : t), rel x y ∨ rel y x ∨ x = y.
Theorem Trans1 (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z) : rel x z.
Admitted.
