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
Theorem dfs'vc (marked : loc -> bool) (busy : loc -> bool) (c : loc) (o1 : bool) (fact0 : well_colored marked busy) (fact1 : only_descendants_are_marked marked) (fact2 : path root c) (fact3 : if decide (¬ c = null) then o1 = (if decide (marked c = true) then false else true) else o1 = false) : if decide (o1 = true) then let o2 : loc := left1 c in (well_colored (fun_updt marked c true) (fun_updt busy c true) ∧ only_descendants_are_marked (fun_updt marked c true) ∧ path root o2) ∧ (∀(busy1 : loc -> bool) (marked1 : loc -> bool), well_colored marked1 busy1 ∧ (∀(x : loc), fun_updt marked c true x = true -> marked1 x = true) ∧ (¬ o2 = null -> marked1 o2 = true) ∧ (∀(x : loc), busy1 x = true -> fun_updt busy c true x = true) ∧ only_descendants_are_marked marked1 -> (let o3 : loc := right1 c in (well_colored marked1 busy1 ∧ only_descendants_are_marked marked1 ∧ path root o3) ∧ (∀(busy2 : loc -> bool) (marked2 : loc -> bool), well_colored marked2 busy2 ∧ (∀(x : loc), marked1 x = true -> marked2 x = true) ∧ (¬ o3 = null -> marked2 o3 = true) ∧ (∀(x : loc), busy2 x = true -> busy1 x = true) ∧ only_descendants_are_marked marked2 -> well_colored marked2 (fun_updt busy2 c false) ∧ (∀(x : loc), marked x = true -> marked2 x = true) ∧ (¬ c = null -> marked2 c = true) ∧ (∀(x : loc), fun_updt busy2 c false x = true -> busy x = true) ∧ only_descendants_are_marked marked2))) else well_colored marked busy ∧ (¬ c = null -> marked c = true) ∧ only_descendants_are_marked marked.
Proof.
Admitted.
