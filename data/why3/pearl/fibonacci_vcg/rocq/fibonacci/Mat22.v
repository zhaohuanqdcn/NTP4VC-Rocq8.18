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
  | t'mk : Z -> Z -> Z -> Z -> t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition a11 (x : t) := match x with |  t'mk a _ _ _ => a end.
Definition a12 (x : t) := match x with |  t'mk _ a _ _ => a end.
Definition a21 (x : t) := match x with |  t'mk _ _ a _ => a end.
Definition a22 (x : t) := match x with |  t'mk _ _ _ a => a end.
Definition mult (x : t) (y : t) : t := t'mk (a11 x * a11 y + a12 x * a21 y) (a11 x * a12 y + a12 x * a22 y) (a21 x * a11 y + a22 x * a21 y) (a21 x * a12 y + a22 x * a22 y).
Axiom power : t -> Z -> t.
Axiom Power_0 : forall  (x : t), power x 0%Z = t'mk 1%Z 0%Z 0%Z 1%Z.
Axiom Power_s : forall  (n : Z) (x : t) (fact0 : 0%Z ≤ n), power x (n + 1%Z) = mult x (power x n).
Axiom Power_s_alt : forall  (n : Z) (x : t) (fact0 : 0%Z < n), power x n = mult x (power x (n - 1%Z)).
Axiom Power_1 : forall  (x : t), power x 1%Z = x.
Axiom Power_sum : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), power x (n + m) = mult (power x n) (power x m).
Axiom Power_mult : forall  (n : Z) (m : Z) (x : t) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), power x (n * m) = power (power x n) m.
Axiom Power_comm1 : forall  (x : t) (y : t) (n : Z) (fact0 : mult x y = mult y x) (fact1 : 0%Z ≤ n), mult (power x n) y = mult y (power x n).
Axiom Power_comm2 : forall  (x : t) (y : t) (n : Z) (fact0 : mult x y = mult y x) (fact1 : 0%Z ≤ n), power (mult x y) n = mult (power x n) (power y n).
