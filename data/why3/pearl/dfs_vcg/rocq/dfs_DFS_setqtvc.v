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
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Axiom root : loc.
Axiom left1 : loc -> loc.
Axiom right1 : loc -> loc.
Axiom marks : Type.
Axiom marks_inhabited : Inhabited marks.
Global Existing Instance marks_inhabited.
Axiom marks_countable : Countable marks.
Global Existing Instance marks_countable.
Axiom o1 : (loc -> bool) -> loc -> bool -> loc -> bool.
Axiom o'def : forall  (m : loc -> bool) (l : loc) (b : bool) (x : loc), (o1 m l b x = true) = (if decide (x = l) then b = true else m x = true).
Theorem set'vc (m : loc -> bool) (l : loc) (b : bool) (m1 : loc -> bool) (fact0 : ∀(x : loc), (m x = true) = (if decide (x = l) then b = true else m1 x = true)) : m = fun_updt m1 l b.
Proof.
Admitted.
