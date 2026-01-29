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
Axiom iter : forall {α : Type} `{Inhabited α}, (α -> α) -> Z -> α -> α.
Axiom iter'def : forall  {α : Type} `{Inhabited α} (k : Z) (f : α -> α) (x : α) (fact0 : 0%Z ≤ k), if decide (k = 0%Z) then iter f k x = x else iter f k x = iter f (k - 1%Z) (f x).
Axiom iter_1 : forall  {α : Type} `{Inhabited α} (f : α -> α) (x : α), iter f 1%Z x = f x.
Axiom iter_s : forall  {α : Type} `{Inhabited α} (k : Z) (f : α -> α) (x : α) (fact0 : 0%Z < k), iter f k x = f (iter f (k - 1%Z) x).
