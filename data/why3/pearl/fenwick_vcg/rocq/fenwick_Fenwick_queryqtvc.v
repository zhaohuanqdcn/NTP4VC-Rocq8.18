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
Axiom mixfix_lbrb_closure : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom mixfix_lbrb_closure_def : forall  {α : Type} `{Inhabited α} (y : list α) (y1 : Z), mixfix_lbrb_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Theorem query'vc (a : Z) (b : Z) (f : fenwick) (fact0 : 0%Z ≤ a) (fact1 : a ≤ b) (fact2 : b ≤ leaves f) (fact3 : valid f) : ¬ 2%Z = 0%Z ∧ (let lv : Z := Z.rem (Z.of_nat (length (t f))) 2%Z in let o1 : Z := a + lv in let o2 : Z := b + lv in a ≤ b ∧ ((∀(f1 : Z -> Z) (g : Z -> Z), (∀(i : Z), a ≤ i ∧ i < b -> f1 i = g (i + lv)) -> sum f1 a b = sum g (a + lv) (b + lv)) -> ((0%Z ≤ o1 ∧ o1 ≤ o2 ∧ o2 ≤ Z.of_nat (length (t f))) ∧ 0%Z + sum (mixfix_lbrb_closure (t f)) o1 o2 = rget f a b) ∧ (∀(acc : Z) (rb : Z) (ra : Z), (0%Z ≤ ra ∧ ra ≤ rb ∧ rb ≤ Z.of_nat (length (t f))) ∧ acc + sum (mixfix_lbrb_closure (t f)) ra rb = rget f a b -> (if decide (¬ ra = rb) then ¬ 2%Z = 0%Z ∧ (if decide (Z.quot ra 2%Z = 0%Z) then let o3 : list Z := t f in (0%Z ≤ ra ∧ ra < Z.of_nat (length o3)) ∧ ¬ 2%Z = 0%Z ∧ ¬ 2%Z = 0%Z ∧ (if decide (¬ Z.quot (rb - 1%Z) 2%Z = 0%Z) then let o4 : list Z := t f in (0%Z ≤ rb - 1%Z ∧ rb - 1%Z < Z.of_nat (length o4)) ∧ ¬ 2%Z = 0%Z ∧ ((0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z) ∧ 2%Z * Z.rem (rb - 1%Z) 2%Z < Z.of_nat (length (t f)) ∧ valid f) ∧ (sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = sum (mixfix_lbrb_closure (t f)) (2%Z * Z.rem ra 2%Z + 1%Z) (2%Z * Z.rem (rb - 1%Z) 2%Z + 1%Z) -> (0%Z ≤ rb - ra ∧ Z.rem (rb - 1%Z) 2%Z - Z.rem ra 2%Z < rb - ra) ∧ (0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z ∧ Z.rem (rb - 1%Z) 2%Z ≤ Z.of_nat (length (t f))) ∧ acc + nth (Z.to_nat ra) o3 inhabitant + nth (Z.to_nat (rb - 1%Z)) o4 inhabitant + sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = rget f a b) else ¬ 2%Z = 0%Z ∧ ((0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z) ∧ 2%Z * Z.rem (rb - 1%Z) 2%Z < Z.of_nat (length (t f)) ∧ valid f) ∧ (sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = sum (mixfix_lbrb_closure (t f)) (2%Z * Z.rem ra 2%Z + 1%Z) (2%Z * Z.rem (rb - 1%Z) 2%Z + 1%Z) -> (0%Z ≤ rb - ra ∧ Z.rem (rb - 1%Z) 2%Z - Z.rem ra 2%Z < rb - ra) ∧ (0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z ∧ Z.rem (rb - 1%Z) 2%Z ≤ Z.of_nat (length (t f))) ∧ acc + nth (Z.to_nat ra) o3 inhabitant + sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = rget f a b)) else ¬ 2%Z = 0%Z ∧ ¬ 2%Z = 0%Z ∧ (if decide (¬ Z.quot (rb - 1%Z) 2%Z = 0%Z) then let o3 : list Z := t f in (0%Z ≤ rb - 1%Z ∧ rb - 1%Z < Z.of_nat (length o3)) ∧ ¬ 2%Z = 0%Z ∧ ((0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z) ∧ 2%Z * Z.rem (rb - 1%Z) 2%Z < Z.of_nat (length (t f)) ∧ valid f) ∧ (sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = sum (mixfix_lbrb_closure (t f)) (2%Z * Z.rem ra 2%Z + 1%Z) (2%Z * Z.rem (rb - 1%Z) 2%Z + 1%Z) -> (0%Z ≤ rb - ra ∧ Z.rem (rb - 1%Z) 2%Z - Z.rem ra 2%Z < rb - ra) ∧ (0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z ∧ Z.rem (rb - 1%Z) 2%Z ≤ Z.of_nat (length (t f))) ∧ acc + nth (Z.to_nat (rb - 1%Z)) o3 inhabitant + sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = rget f a b) else ¬ 2%Z = 0%Z ∧ ((0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z) ∧ 2%Z * Z.rem (rb - 1%Z) 2%Z < Z.of_nat (length (t f)) ∧ valid f) ∧ (sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = sum (mixfix_lbrb_closure (t f)) (2%Z * Z.rem ra 2%Z + 1%Z) (2%Z * Z.rem (rb - 1%Z) 2%Z + 1%Z) -> (0%Z ≤ rb - ra ∧ Z.rem (rb - 1%Z) 2%Z - Z.rem ra 2%Z < rb - ra) ∧ (0%Z ≤ Z.rem ra 2%Z ∧ Z.rem ra 2%Z ≤ Z.rem (rb - 1%Z) 2%Z ∧ Z.rem (rb - 1%Z) 2%Z ≤ Z.of_nat (length (t f))) ∧ acc + sum (mixfix_lbrb_closure (t f)) (Z.rem ra 2%Z) (Z.rem (rb - 1%Z) 2%Z) = rget f a b))) else acc = rget f a b)))).
Proof.
Admitted.
