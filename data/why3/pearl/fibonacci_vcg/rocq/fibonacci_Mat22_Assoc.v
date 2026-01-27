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
  | t'mk : Z -> Z -> Z -> Z -> t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition a11 (x : t) := match x with |  t'mk a _ _ _ => a end.
Definition a12 (x : t) := match x with |  t'mk _ a _ _ => a end.
Definition a21 (x : t) := match x with |  t'mk _ _ a _ => a end.
Definition a22 (x : t) := match x with |  t'mk _ _ _ a => a end.
Definition mult (x : t) (y : t) : t := t'mk (a11 x * a11 y + a12 x * a21 y) (a11 x * a12 y + a12 x * a22 y) (a21 x * a11 y + a22 x * a21 y) (a21 x * a12 y + a22 x * a22 y).
Theorem Assoc (x : t) (y : t) (z : t) : mult (mult x y) z = mult x (mult y z).
Admitted.
