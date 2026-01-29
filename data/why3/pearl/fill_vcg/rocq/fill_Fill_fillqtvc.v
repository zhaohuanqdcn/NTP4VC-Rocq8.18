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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Inductive tree :=
  | Null : tree
  | Node : tree -> elt -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint contains (t : tree) (x : elt) : Prop :=
match t with | Null => False | Node l y r => contains l x ∨ x = y ∨ contains r x end.
Admit Obligations.
Theorem fill'vc (start : Z) (a : list elt) (t : tree) (fact0 : 0%Z ≤ start) (fact1 : start ≤ Z.of_nat (length a)) : match t with | Null => (start ≤ start ∧ start ≤ Z.of_nat (length a)) ∧ (∀(i : Z), start ≤ i ∧ i < start -> contains t (nth (Z.to_nat i) a inhabitant)) | Node l x r => ((match t with | Null => False | Node f _ f1 => f = l ∨ f1 = l end) ∧ 0%Z ≤ start ∧ start ≤ Z.of_nat (length a)) ∧ (∀(a1 : list elt), length a1 = length a -> (∀(res : Z), (start ≤ res ∧ res ≤ Z.of_nat (length a1)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < start -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), start ≤ i ∧ i < res -> contains l (nth (Z.to_nat i) a1 inhabitant)) -> (if decide (¬ res = Z.of_nat (length a1)) then (0%Z ≤ res ∧ res < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat res) x) = length a1 -> nth_i (set_list a1 (Z.to_nat res) x) = fun_updt (nth_i a1) res x -> (let o1 : Z := res + 1%Z in ((match t with | Null => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length (set_list a1 (Z.to_nat res) x))) ∧ (∀(a2 : list elt), length a2 = length (set_list a1 (Z.to_nat res) x) -> (∀(result : Z), (o1 ≤ result ∧ result ≤ Z.of_nat (length a2)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) (set_list a1 (Z.to_nat res) x) inhabitant) ∧ (∀(i : Z), o1 ≤ i ∧ i < result -> contains r (nth (Z.to_nat i) a2 inhabitant)) -> (start ≤ result ∧ result ≤ Z.of_nat (length a2)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < start -> nth (Z.to_nat i) a2 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), start ≤ i ∧ i < result -> contains t (nth (Z.to_nat i) a2 inhabitant)))))) else (start ≤ res ∧ res ≤ Z.of_nat (length a1)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < start -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), start ≤ i ∧ i < res -> contains t (nth (Z.to_nat i) a1 inhabitant))))) end.
Proof.
Admitted.
