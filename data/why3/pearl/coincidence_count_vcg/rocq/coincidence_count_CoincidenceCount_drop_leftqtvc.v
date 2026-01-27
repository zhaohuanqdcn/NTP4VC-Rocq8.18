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
Axiom mixfix_lbrb_closure : forall {α : Type} `{Inhabited α} `{Countable α}, list α -> Z -> α.
Axiom mixfix_lbrb_closure_def : forall  {α : Type} `{Inhabited α} `{Countable α} (y : list α) (y1 : Z), mixfix_lbrb_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Definition setof {α : Type} `{Inhabited α} `{Countable α} (a : list α) : gset α := gset_map (mixfix_lbrb_closure a) (gset_interval 0%Z (Z.of_nat (length a))).
Definition drop {α : Type} `{Inhabited α} `{Countable α} (a : list α) (n : Z) : gset α := gset_map (mixfix_lbrb_closure a) (gset_interval n (Z.of_nat (length a))).
Theorem drop_left'vc {α : Type} `{Inhabited α} `{Countable α} (n : Z) (a : list α) (fact0 : 0%Z ≤ n) (fact1 : n < Z.of_nat (length a)) : drop a n = insert_set (nth (Z.to_nat n) a inhabitant) (drop a (n + 1%Z)).
Admitted.
