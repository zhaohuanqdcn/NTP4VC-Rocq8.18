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
Require Import Why3.bintree.Tree.
Open Scope Z_scope.
Program Fixpoint occ {α : Type} `{Inhabited α} (x : α) (t : tree α) : Z :=
match t with | Empty => 0%Z | Node l y r => (if decide (y = x) then 1%Z else 0%Z) + occ x l + occ x r end.
Admit Obligations.
Axiom occ_nonneg : forall  {α : Type} `{Inhabited α} (x : α) (t : tree α), 0%Z ≤ occ x t.
Definition mem {α : Type} `{Inhabited α} (x : α) (t : tree α) := 0%Z < occ x t.
