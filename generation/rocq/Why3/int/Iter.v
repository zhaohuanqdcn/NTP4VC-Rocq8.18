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
Axiom iter : forall {α : Type} `{Inhabited α}, (α -> α) -> Z -> α -> α.
Axiom iter'def : forall  {α : Type} `{Inhabited α} (k : Z) (f : α -> α) (x : α) (fact0 : 0%Z ≤ k), if decide (k = 0%Z) then iter f k x = x else iter f k x = iter f (k - 1%Z) (f x).
Axiom iter_1 : forall  {α : Type} `{Inhabited α} (f : α -> α) (x : α), iter f 1%Z x = f x.
Axiom iter_s : forall  {α : Type} `{Inhabited α} (k : Z) (f : α -> α) (x : α) (fact0 : 0%Z < k), iter f k x = f (iter f (k - 1%Z) x).
