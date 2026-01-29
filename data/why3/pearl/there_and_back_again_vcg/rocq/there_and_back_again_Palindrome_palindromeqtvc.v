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
Definition pal {α : Type} `{Inhabited α} (x : list α) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> nth_error_i x i = nth_error_i x (n - 1%Z - i).
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom eq : elt -> elt -> Prop.
Axiom eq'spec : forall  (x : elt) (y : elt), eq x y = (x = y).
Theorem palindrome'vc (x : list elt) : Z.of_nat (length x) ≤ Z.of_nat (length x) ∧ (∀(o1 : list elt), (∃(x0 : list elt), length x0 = length x ∧ x = x0 ++ o1) ∧ pal x (Z.of_nat (length x)) -> pal x (Z.of_nat (length x))) ∧ ((∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length x)) ∧ ¬ nth_error_i x i = nth_error_i x (Z.of_nat (length x) - 1%Z - i)) -> ¬ pal x (Z.of_nat (length x))).
Proof.
Admitted.
