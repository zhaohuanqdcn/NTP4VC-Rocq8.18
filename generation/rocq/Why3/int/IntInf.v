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
Inductive t :=
  | Finite : Z -> t
  | Infinite : t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition add (x : t) (y : t) : t := match x with | Infinite => Infinite | Finite x1 => (match y with | Infinite => Infinite | Finite y1 => Finite (x1 + y1) end) end.
Definition eq (x : t) (y : t) := match (x, y) with | (Infinite, Infinite) => True | (Finite x1, Finite y1) => x1 = y1 | (_, _) => False end.
Definition lt (x : t) (y : t) := match x with | Infinite => False | Finite x1 => (match y with | Infinite => True | Finite y1 => x1 < y1 end) end.
Definition le (x : t) (y : t) := lt x y ∨ eq x y.
Axiom Refl : forall  (x : t), le x x.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Antisymm : forall  (x : t) (y : t) (fact0 : le x y) (fact1 : le y x), x = y.
Axiom Total : forall  (x : t) (y : t), le x y ∨ le y x.
