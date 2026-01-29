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
