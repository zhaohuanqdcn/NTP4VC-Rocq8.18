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
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom eq : loc -> loc -> Prop.
Axiom eq'spec : forall  (x : loc) (y : loc), eq x y = (x = y).
Inductive kind :=
  | Parent : kind
  | Left : kind
  | Right : kind.
Axiom kind_inhabited : Inhabited kind.
Global Existing Instance kind_inhabited.
Axiom kind_countable : Countable kind.
Global Existing Instance kind_countable.
Axiom pmem : Type.
Axiom pmem_inhabited : Inhabited pmem.
Global Existing Instance pmem_inhabited.
Axiom pmem_countable : Countable pmem.
Global Existing Instance pmem_countable.
Axiom memory : Type.
Axiom memory_inhabited : Inhabited memory.
Global Existing Instance memory_inhabited.
Axiom memory_countable : Countable memory.
Global Existing Instance memory_countable.
Axiom accessor : memory -> kind -> loc -> loc.
Axiom mark : memory -> loc -> bool.
Axiom null : loc.
Axiom non_det_magic : Type.
Axiom non_det_magic_inhabited : Inhabited non_det_magic.
Global Existing Instance non_det_magic_inhabited.
Axiom non_det_magic_countable : Countable non_det_magic.
Global Existing Instance non_det_magic_countable.
Axiom non_det : Type.
Axiom non_det_inhabited : Inhabited non_det.
Global Existing Instance non_det_inhabited.
Axiom non_det_countable : Countable non_det.
Global Existing Instance non_det_countable.
Axiom non_det_field : non_det -> non_det_magic.
