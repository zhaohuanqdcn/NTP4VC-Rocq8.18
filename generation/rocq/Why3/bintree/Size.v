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
Program Fixpoint size {α : Type} `{Inhabited α} (t : tree α) : Z :=
match t with | Empty => 0%Z | Node l _ r => 1%Z + size l + size r end.
Admit Obligations.
Axiom size_nonneg : forall  {α : Type} `{Inhabited α} (t : tree α), 0%Z ≤ size t.
Axiom size_empty : forall  {α : Type} `{Inhabited α} (t : tree α), (0%Z = size t) = (t = (Empty : tree α)).
