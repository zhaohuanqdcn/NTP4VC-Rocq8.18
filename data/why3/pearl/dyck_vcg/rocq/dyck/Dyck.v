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
Inductive paren :=
  | L : paren
  | R : paren.
Axiom paren_inhabited : Inhabited paren.
Global Existing Instance paren_inhabited.
Axiom paren_countable : Countable paren.
Global Existing Instance paren_countable.
Inductive dyck : list paren -> Prop :=
 | Dyck_nil : dyck ([] : list paren)
 | Dyck_ind (w1 : list paren) (w2 : list paren) : dyck w1 -> dyck w2 -> dyck (cons L (w1 ++ cons R w2)).
