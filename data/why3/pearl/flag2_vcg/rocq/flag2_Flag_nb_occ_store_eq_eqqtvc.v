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
Inductive color :=
  | Blue : color
  | White : color
  | Red : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Definition monochrome (a : Z -> color) (i : Z) (j : Z) (c : color) := ∀(k : Z), i ≤ k ∧ k < j -> a k = c.
Axiom nb_occ : (Z -> color) -> Z -> Z -> color -> Z.
Axiom nb_occ'def : forall  (j : Z) (i : Z) (a : Z -> color) (c : color), if decide (j ≤ i) then nb_occ a i j c = 0%Z else if decide (a (j - 1%Z) = c) then nb_occ a i j c = 1%Z + nb_occ a i (j - 1%Z) c else nb_occ a i j c = nb_occ a i (j - 1%Z) c.
Theorem nb_occ_store_eq_eq'vc (i : Z) (k : Z) (j : Z) (a : Z -> color) (fact0 : i ≤ k) (fact1 : k < j) : nb_occ (fun_updt a k (a k)) i j (a k) = nb_occ a i j (a k).
Admitted.
