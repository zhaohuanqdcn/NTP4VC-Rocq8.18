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
Theorem sum_dec'vc (a : Z) (b : Z) (f : Z -> Z) (g : Z -> Z) (c : Z) (fact0 : a ≤ b) (fact1 : ∀(i : Z), a ≤ i ∧ i < b -> f i = g (i + c)) : sum f a b = sum g (a + c) (b + c).
Proof.
Admitted.
