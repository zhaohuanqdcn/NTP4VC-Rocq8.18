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
Open Scope Z_scope.
Axiom m : Z.
Axiom m_positive : 0%Z < m.
Axiom n : Z.
Axiom n_nonnegative : 0%Z ≤ n.
Inductive shuffle { α : Type} : list α -> list α -> list α -> Prop :=
 | Shuffle_nil_left (l : list α) : shuffle l ([] : list α) l
 | Shuffle_nil_right (l : list α) : shuffle ([] : list α) l l
 | Shuffle_cons_left (a : list α) (b : list α) (c : list α) (x : α) : shuffle a b c -> shuffle (cons x a) b (cons x c)
 | Shuffle_cons_right (a : list α) (b : list α) (c : list α) (x : α) : shuffle a b c -> shuffle a (cons x b) (cons x c).
Definition suit_ordered (l : list Z) := ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j ∧ j < m -> nth_error_i l (i * m + j) = Some j.
Definition suit_sorted (l : list Z) := (∀(i : Z) (v : Z), nth_error_i l i = Some v -> 0%Z ≤ v ∧ v < m) ∧ (∀(i : Z) (j1 : Z) (j2 : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j1 ∧ j1 < m -> 0%Z ≤ j2 ∧ j2 < m -> ¬ nth_error_i l (i * m + j1) = nth_error_i l (i * m + j2)).
Axiom gilbreath_card_trick : forall  (a : list Z) (c : list Z) (d : list Z) (b : list Z) (fact0 : Z.of_nat (length a) = n * m) (fact1 : suit_ordered a) (fact2 : a = c ++ d) (fact3 : shuffle c (rev d) b), suit_sorted b.
