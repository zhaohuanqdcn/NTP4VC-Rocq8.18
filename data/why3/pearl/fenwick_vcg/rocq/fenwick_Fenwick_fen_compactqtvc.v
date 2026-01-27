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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Inductive fenwick :=
  | fenwick'mk : list Z -> Z -> fenwick.
Axiom fenwick_inhabited : Inhabited fenwick.
Global Existing Instance fenwick_inhabited.
Axiom fenwick_countable : Countable fenwick.
Global Existing Instance fenwick_countable.
Definition t (x : fenwick) := match x with |  fenwick'mk a _ => a end.
Definition leaves (x : fenwick) := match x with |  fenwick'mk _ a => a end.
Definition valid (f : fenwick) := 0%Z ≤ leaves f ∧ Z.of_nat (length (t f)) = (if decide (leaves f = 0%Z) then 0%Z else 2%Z * leaves f - 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < leaves f - 1%Z -> nth (Z.to_nat i) (t f) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (t f) inhabitant + nth (Z.to_nat (2%Z * i + 2%Z)) (t f) inhabitant).
Definition get (f : fenwick) (i : Z) : Z := nth (Z.to_nat (i + leaves f - 1%Z)) (t f) inhabitant.
Axiom get_closure : fenwick -> Z -> Z.
Axiom get_closure_def : forall  (y : fenwick) (y1 : Z), get_closure y y1 = get y y1.
Definition rget (f : fenwick) (a : Z) (b : Z) : Z := sum (get_closure f) a b.
Axiom mixfix_lbrb_closure : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom mixfix_lbrb_closure_def : forall  {α : Type} `{Inhabited α} (y : list α) (y1 : Z), mixfix_lbrb_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Theorem fen_compact'vc (a : Z) (b : Z) (f : fenwick) (fact0 : 0%Z ≤ a) (fact1 : a ≤ b) (fact2 : 2%Z * b < Z.of_nat (length (t f))) (fact3 : valid f) : sum (mixfix_lbrb_closure (t f)) a b = sum (mixfix_lbrb_closure (t f)) (2%Z * a + 1%Z) (2%Z * b + 1%Z).
Admitted.
