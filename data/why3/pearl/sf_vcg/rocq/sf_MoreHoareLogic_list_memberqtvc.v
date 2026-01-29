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
Program Fixpoint sum (l : list Z) : Z :=
match l with | [] => 0%Z | cons x r => x + sum r end.
Admit Obligations.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom eq : elt -> elt -> Prop.
Axiom eq'spec : forall  (x : elt) (y : elt), eq x y = (x = y).
Theorem list_member'vc (x : list elt) (y : elt) : Z.of_nat (length x) ≤ Z.of_nat (length x) ∧ (0%Z = 1%Z ∧ y ∈ x ∨ True) ∧ (∀(z : Z) (x1 : list elt), Z.of_nat (length x1) ≤ Z.of_nat (length x) ∧ (y ∈ x1 -> y ∈ x) ∧ (z = 1%Z ∧ y ∈ x ∨ z = 0%Z ∧ (y ∈ x -> y ∈ x1)) -> is_Nil x1 = (x1 = ([] : list elt)) -> (if decide (¬ is_Nil x1) then ¬ x1 = ([] : list elt) ∧ (∀(o1 : elt), Some o1 = hd_error x1 -> eq y o1 = (y = o1) -> (if decide (eq y o1) then ¬ x1 = ([] : list elt) ∧ (∀(o2 : list elt), Some o2 = tl_error x1 -> (match x1 with | [] => False | cons _ f => f = o2 end) ∧ Z.of_nat (length o2) ≤ Z.of_nat (length x) ∧ (y ∈ o2 -> y ∈ x) ∧ (y ∈ x ∨ 1%Z = 0%Z ∧ (y ∈ x -> y ∈ o2))) else ¬ x1 = ([] : list elt) ∧ (∀(o2 : list elt), Some o2 = tl_error x1 -> (match x1 with | [] => False | cons _ f => f = o2 end) ∧ Z.of_nat (length o2) ≤ Z.of_nat (length x) ∧ (y ∈ o2 -> y ∈ x) ∧ (z = 1%Z ∧ y ∈ x ∨ z = 0%Z ∧ (y ∈ x -> y ∈ o2))))) else (z = 1%Z) = (y ∈ x))).
Proof.
Admitted.
