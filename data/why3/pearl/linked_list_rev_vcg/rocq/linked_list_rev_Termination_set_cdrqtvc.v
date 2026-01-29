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
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Inductive mem :=
  | mem'mk : (loc -> loc) -> mem.
Axiom mem_inhabited : Inhabited mem.
Global Existing Instance mem_inhabited.
Axiom mem_countable : Countable mem.
Global Existing Instance mem_countable.
Definition next (x : mem) := match x with |  mem'mk a => a end.
Axiom o1 : (loc -> loc) -> loc -> loc -> loc -> loc.
Axiom o'def : forall  (mem1 : loc -> loc) (p : loc) (v : loc) (x : loc), o1 mem1 p v x = (if decide (x = p) then v else mem1 x).
Theorem set_cdr'vc (p : loc) (mem1 : loc -> loc) (v : loc) (mem2 : loc -> loc) (fact0 : ¬ p = null) (fact1 : ∀(x : loc), mem1 x = (if decide (x = p) then v else mem2 x)) : mem1 = fun_updt mem2 p v.
Proof.
Admitted.
