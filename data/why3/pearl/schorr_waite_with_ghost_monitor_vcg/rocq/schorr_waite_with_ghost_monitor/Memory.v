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
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Axiom memory : Type.
Axiom memory_inhabited : Inhabited memory.
Global Existing Instance memory_inhabited.
Axiom memory_countable : Countable memory.
Global Existing Instance memory_countable.
Axiom left1 : memory -> loc -> loc.
Axiom right1 : memory -> loc -> loc.
Axiom mark : memory -> loc -> bool.
Axiom color : memory -> loc -> bool.
Definition update {α : Type} `{Inhabited α} (m1 : loc -> α) (m2 : loc -> α) (l : loc) (v : α) := m1 l = v ∧ (∀(x : loc), ¬ x = l -> m1 x = m2 x).
