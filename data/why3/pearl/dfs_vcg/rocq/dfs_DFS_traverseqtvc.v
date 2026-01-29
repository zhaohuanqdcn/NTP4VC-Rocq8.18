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
Definition edge (x : loc) (y : loc) := ¬ x = null ∧ (left1 x = y ∨ right1 x = y).
Inductive path : loc -> loc -> Prop :=
 | path_nil (x : loc) : path x x
 | path_cons (x : loc) (y : loc) (z : loc) : path x y -> edge y z -> path x z.
Definition only_descendants_are_marked (marked : loc -> bool) := ∀(x : loc), ¬ x = null ∧ marked x = true -> path root x.
Definition well_colored (marked : loc -> bool) (busy : loc -> bool) := ∀(x : loc) (y : loc), edge x y -> ¬ y = null -> busy x = true ∨ (marked x = true -> marked y = true).
Definition all_descendants_are_marked (marked : loc -> bool) := ¬ root = null -> marked root = true ∧ (∀(x : loc) (y : loc), edge x y -> marked x = true -> ¬ y = null -> marked y = true).
Theorem traverse'vc (marked : loc -> bool) (busy : loc -> bool) (fact0 : ∀(x : loc), ¬ x = null -> marked x = false ∧ busy x = false) : let o1 : loc := root in (well_colored marked busy ∧ only_descendants_are_marked marked ∧ path root o1) ∧ (∀(busy1 : loc -> bool) (marked1 : loc -> bool), well_colored marked1 busy1 ∧ (∀(x : loc), marked x = true -> marked1 x = true) ∧ (¬ o1 = null -> marked1 o1 = true) ∧ (∀(x : loc), busy1 x = true -> busy x = true) ∧ only_descendants_are_marked marked1 -> only_descendants_are_marked marked1 ∧ all_descendants_are_marked marked1 ∧ (∀(x : loc), ¬ x = null -> busy1 x = false)).
Proof.
Admitted.
