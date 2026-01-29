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
Inductive t :=
  | t'mk : (Z -> Z) -> Z -> t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition f (x : t) := match x with |  t'mk a _ => a end.
Definition n (x : t) := match x with |  t'mk _ a => a end.
Axiom identity : Z -> Z.
Axiom o1 : (Z -> Z) -> Z -> Z.
Axiom identity_def : forall  (y : Z), identity y = y.
Axiom o'def : forall  (o2 : Z -> Z) (z : Z), o1 o2 z = (if decide (z = 3%Z) then 42%Z else o2 z).
Theorem test'vc : True.
Proof.
Admitted.
