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
Inductive nat :=
  | ONat : nat
  | SNat : nat -> nat.
Axiom nat_inhabited : Inhabited nat.
Global Existing Instance nat_inhabited.
Axiom nat_countable : Countable nat.
Global Existing Instance nat_countable.
Program Fixpoint nat_to_int (n : nat) : Z :=
match n with | ONat => 0%Z | SNat n1 => 1%Z + nat_to_int n1 end.
Admit Obligations.
Program Fixpoint add_nat (n1 : nat) (n2 : nat) : nat :=
match n1 with | ONat => n2 | SNat n11 => SNat (add_nat n11 n2) end.
Admit Obligations.
