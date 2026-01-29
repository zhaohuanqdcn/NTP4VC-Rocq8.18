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
Theorem nb_occ_store_outside_down'vc (k : Z) (i : Z) (j : Z) (a : Z -> color) (c : color) (fact0 : k < i) (fact1 : i ≤ j) : nb_occ (fun_updt a k c) i j c = nb_occ a i j c.
Proof.
Admitted.
