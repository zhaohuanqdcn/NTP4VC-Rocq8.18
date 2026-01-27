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
Axiom match_bool : forall {α : Type} `{Inhabited α}, bool -> α -> α -> α.
Axiom eqb : forall {α : Type} `{Inhabited α}, α -> α -> bool.
Axiom eqb1 : forall  {α : Type} `{Inhabited α} (x : α) (y : α), (eqb x y = true) = (x = y).
Axiom neqb : forall {α : Type} `{Inhabited α}, α -> α -> bool.
Axiom neqb1 : forall  {α : Type} `{Inhabited α} (x : α) (y : α), (neqb x y = true) = (¬ x = y).
Axiom zlt : Z -> Z -> bool.
Axiom zleq : Z -> Z -> bool.
Axiom zlt1 : forall  (x : Z) (y : Z), (zlt x y = true) = (x < y).
Axiom zleq1 : forall  (x : Z) (y : Z), (zleq x y = true) = (x ≤ y).
Axiom rlt : R -> R -> bool.
Axiom rleq : R -> R -> bool.
Axiom rlt1 : forall  (x : R) (y : R), (rlt x y = true) = Rlt x y.
Axiom rleq1 : forall  (x : R) (y : R), (rleq x y = true) = Rle x y.
Axiom c_euclidian : forall  (d : Z) (n : Z) (fact0 : ¬ d = 0%Z), n = Z.rem n d * d + Z.quot n d.
Axiom cdiv_cases : forall  (n : Z) (d : Z), (n ≤ 0%Z -> 0%Z < d -> Z.rem n d = - Z.rem (- n) d) ∧ (0%Z ≤ n -> d < 0%Z -> Z.rem n d = - Z.rem n (- d)) ∧ (n ≤ 0%Z -> d < 0%Z -> Z.rem n d = Z.rem (- n) (- d)).
Axiom cmod_cases : forall  (n : Z) (d : Z), (n ≤ 0%Z -> 0%Z < d -> Z.quot n d = - Z.quot (- n) d) ∧ (0%Z ≤ n -> d < 0%Z -> Z.quot n d = Z.quot n (- d)) ∧ (n ≤ 0%Z -> d < 0%Z -> Z.quot n d = - Z.quot (- n) (- d)).
Axiom cmod_remainder : forall  (n : Z) (d : Z), (0%Z ≤ n -> 0%Z < d -> 0%Z ≤ Z.quot n d ∧ Z.quot n d < d) ∧ (n ≤ 0%Z -> 0%Z < d -> - d < Z.quot n d ∧ Z.quot n d ≤ 0%Z) ∧ (0%Z ≤ n -> d < 0%Z -> 0%Z ≤ Z.quot n d ∧ Z.quot n d < - d) ∧ (n ≤ 0%Z -> d < 0%Z -> d < Z.quot n d ∧ Z.quot n d ≤ 0%Z).
Axiom cdiv_neutral : forall  (a : Z), Z.rem a 1%Z = a.
Axiom cdiv_inv : forall  (a : Z) (fact0 : ¬ a = 0%Z), Z.rem a a = 1%Z.
