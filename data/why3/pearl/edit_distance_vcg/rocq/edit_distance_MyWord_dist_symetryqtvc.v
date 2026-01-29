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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Inductive dist : list char -> list char -> Z -> Prop :=
 | dist_eps : dist ([] : list char) ([] : list char) 0%Z
 | dist_add_left (w1 : list char) (w2 : list char) (n : Z) (a : char) : dist w1 w2 n -> dist (cons a w1) w2 (n + 1%Z)
 | dist_add_right (w1 : list char) (w2 : list char) (n : Z) (a : char) : dist w1 w2 n -> dist w1 (cons a w2) (n + 1%Z)
 | dist_context (w1 : list char) (w2 : list char) (n : Z) (a : char) : dist w1 w2 n -> dist (cons a w1) (cons a w2) n.
Definition min_dist (w1 : list char) (w2 : list char) (n : Z) := dist w1 w2 n ∧ (∀(m : Z), dist w1 w2 m -> n ≤ m).
Program Fixpoint last_char (a : char) (u : list char) : char :=
match u with | [] => a | cons c u' => last_char c u' end.
Admit Obligations.
Program Fixpoint but_last (a : char) (u : list char) : list char :=
match u with | [] => ([] : list char) | cons c u' => cons a (but_last c u') end.
Admit Obligations.
Theorem dist_symetry'vc (w1 : list char) (w2 : list char) (n : Z) (fact0 : dist w1 w2 n) : dist w2 w1 n.
Proof.
Admitted.
