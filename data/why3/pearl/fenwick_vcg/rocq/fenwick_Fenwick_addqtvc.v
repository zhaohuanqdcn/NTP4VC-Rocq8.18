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
Theorem add'vc (l : Z) (f : fenwick) (x : Z) (fact0 : 0%Z ≤ l) (fact1 : l < leaves f) (fact2 : valid f) : ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem (Z.of_nat (length (t f))) 2%Z + l in let o2 : list Z := t f in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o2)) ∧ (let o3 : Z := nth (Z.to_nat o1) o2 inhabitant + x in let o4 : list Z := t f in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length o4)) ∧ (∀(f1 : fenwick), let o5 : list Z := t f1 in length (t f1) = length o4 -> f1 = fenwick'mk (t f1) (leaves f) ∧ length (t f1) = length (t f) -> nth_i o5 = fun_updt (nth_i o4) o1 o3 ∧ o5 = set_list o4 (Z.to_nat o1) o3 -> ((0%Z ≤ o1 ∧ o1 < Z.of_nat (length (t f1))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < leaves f1 - 1%Z -> nth (Z.to_nat i) (t f1) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (t f1) inhabitant + nth (Z.to_nat (2%Z * i + 2%Z)) (t f1) inhabitant - (if decide (2%Z * i + 1%Z ≤ o1 ∧ o1 ≤ 2%Z * i + 2%Z) then x else 0%Z))) ∧ (∀(lc : Z) (f2 : fenwick), f2 = fenwick'mk (t f2) (leaves f1) ∧ length (t f2) = length (t f1) -> (0%Z ≤ lc ∧ lc < Z.of_nat (length (t f2))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < leaves f2 - 1%Z -> nth (Z.to_nat i) (t f2) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (t f2) inhabitant + nth (Z.to_nat (2%Z * i + 2%Z)) (t f2) inhabitant - (if decide (2%Z * i + 1%Z ≤ lc ∧ lc ≤ 2%Z * i + 2%Z) then x else 0%Z)) ∧ (∀(i : Z), leaves f2 - 1%Z ≤ i ∧ i < Z.of_nat (length (t f2)) -> nth (Z.to_nat i) (t f2) inhabitant = nth (Z.to_nat i) (t f1) inhabitant) -> (if decide (¬ lc = 0%Z) then ¬ 2%Z = 0%Z ∧ (let o6 : list Z := t f2 in (0%Z ≤ Z.rem (lc - 1%Z) 2%Z ∧ Z.rem (lc - 1%Z) 2%Z < Z.of_nat (length o6)) ∧ (let o7 : Z := nth (Z.to_nat (Z.rem (lc - 1%Z) 2%Z)) o6 inhabitant + x in let o8 : list Z := t f2 in (0%Z ≤ Z.rem (lc - 1%Z) 2%Z ∧ Z.rem (lc - 1%Z) 2%Z < Z.of_nat (length o8)) ∧ (∀(f3 : fenwick), let o9 : list Z := t f3 in length (t f3) = length o8 -> f3 = fenwick'mk (t f3) (leaves f2) ∧ length (t f3) = length (t f2) -> nth_i o9 = fun_updt (nth_i o8) (Z.rem (lc - 1%Z) 2%Z) o7 ∧ o9 = set_list o8 (Z.to_nat (Z.rem (lc - 1%Z) 2%Z)) o7 -> (0%Z ≤ lc ∧ Z.rem (lc - 1%Z) 2%Z < lc) ∧ (0%Z ≤ Z.rem (lc - 1%Z) 2%Z ∧ Z.rem (lc - 1%Z) 2%Z < Z.of_nat (length (t f3))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < leaves f3 - 1%Z -> nth (Z.to_nat i) (t f3) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (t f3) inhabitant + nth (Z.to_nat (2%Z * i + 2%Z)) (t f3) inhabitant - (if decide (2%Z * i + 1%Z ≤ Z.rem (lc - 1%Z) 2%Z ∧ Z.rem (lc - 1%Z) 2%Z ≤ 2%Z * i + 2%Z) then x else 0%Z)) ∧ (∀(i : Z), leaves f3 - 1%Z ≤ i ∧ i < Z.of_nat (length (t f3)) -> nth (Z.to_nat i) (t f3) inhabitant = nth (Z.to_nat i) (t f1) inhabitant)))) else valid f2 ∧ (∀(i : Z), (0%Z ≤ i ∧ i < leaves f2) ∧ ¬ i = l -> get f2 i = get f i) ∧ get f2 l = get f l + x))))).
Proof.
Admitted.
