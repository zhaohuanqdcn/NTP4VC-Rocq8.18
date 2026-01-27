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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Axiom eq_loc : loc -> loc -> Prop.
Axiom eq_loc'spec : forall  (x : loc) (y : loc), eq_loc x y = (x = y).
Inductive node :=
  | node'mk : loc -> loc -> Z -> node.
Axiom node_inhabited : Inhabited node.
Global Existing Instance node_inhabited.
Axiom node_countable : Countable node.
Global Existing Instance node_countable.
Definition left1 (x : node) := match x with |  node'mk a _ _ => a end.
Definition right1 (x : node) := match x with |  node'mk _ a _ => a end.
Definition data (x : node) := match x with |  node'mk _ _ a => a end.
Axiom memory : Type.
Axiom memory_inhabited : Inhabited memory.
Global Existing Instance memory_inhabited.
Axiom memory_countable : Countable memory.
Global Existing Instance memory_countable.
Theorem get_data'vc : True.
Admitted.
